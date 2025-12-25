---
date: '2024-12-18T14:16:42+08:00'
draft: false
title: 'Go: GPM的数量限制'
---
## G

协程的抽象

Goroutine  (go /ruːˈtiːn/  谐音 Go 如 听) 经 Golang 优化后的特殊“协程”

### G限制

语言上无任何的限制,但是理论上会受到机器的内存限制,每个G创建时会占用4KB左右的内存空间

注：Goroutine 创建所需申请的 2-4KB 是需要连续的内存块。

## M

系统线程的抽象

在 Go 的并发模型中，G（Goroutine）是一个轻量级的执行单元，它需要通过系统线程（M）来执行。
每个 G 都会被映射到一个可用的 M 上，M 是操作系统层面的线程，负责实际的 CPU 执行。

### M限制

M 是可以通过runtime下的 debug包SetMaxThreads函数去设置的。默认值为10,000 个线程
[官方文档](https://pkg.go.dev/runtime/debug#SetMaxThreads)
>SetMaxThreads 设置 Go 程序可以使用的操作系统线程的最大数量。如果程序尝试使用超过这个数量的线程，程序将崩溃。SetMaxThreads 返回之前的设置值。初始设置为 10,000 个线程。
>?
>这个限制控制的是操作系统线程的数量，而不是 goroutine 的数量。只有当 goroutine 准备运行，但所有现有的线程都因系统调用、cgo 调用被阻塞，或者由于使用了 runtime.LockOSThread 被锁定给其他 goroutine 时，Go 程序才会创建一个新的线程。
>
>SetMaxThreads 主要用于限制那些创建无限数量线程的程序的影响。其目的是在程序把操作系统拖垮之前先把程序本身终止掉。

## P

p即 processor，是 golang 中的调度器；

p 是 gmp 的中枢，借由 p 承上启下，实现 g 和 m 之间的动态有机结合；

### P限制

1. 环境变量 GOMAXPROCS限制
2. 可以通过 runtime.GOMAXPROCS() 来设定 P 的值， 默认值为CPU 的（逻辑核）核数
