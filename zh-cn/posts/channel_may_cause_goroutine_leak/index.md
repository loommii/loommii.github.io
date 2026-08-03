# Go中Channel可能会引发Goroutine泄漏


<!--more-->

## Go中Channel可能会引发Goroutine泄漏

### 疑问

#### 什么是Goroutine泄漏？

Goroutine泄漏是指Goroutine在程序中被创建后，由于某种原因无法正常结束，并且永远不会被垃圾回收（GC）。这会导致Goroutine占用的资源（如内存、栈空间等）无法释放，随着时间的推移，可能会耗尽系统资源，导致程序崩溃。

#### Channel如何导致Goroutine泄漏？

Channel是Goroutine之间同步和通信的重要机制。但是如果Channel的使用不当，就可能导致Goroutine阻塞并最终泄漏。以下是导致泄漏的常见场景：

- 发送阻塞: Goroutine尝试向一个已满的无缓冲Channel或已满的有缓冲Channel发送数据，如果没有其他Goroutine接收数据，发送操作会阻塞。
- 接收阻塞:  Goroutine尝试从一个空的无缓冲Channel或空的有缓冲Channel接收数据，如果没有其他Goroutine发送数据，接收操作会阻塞。

泄漏的原因是goroutine操作channel后，处于发送或接收阻塞状态，而channel处于满或空的状态，一直得不到改变。同时，垃圾回收器也不会回收此类资源，进而导致gouroutine会一直处于等待队列中，不见天日。

### 代码示例

```go
package main

import (
    "fmt"
    "runtime"
    "time"
)

func main() {
    ch := make(chan int) // 无缓冲Channel

    go func() {
        ch <- 1 // 第一次发送成功（Channel未满）
        fmt.Println("第一次发送成功")
        ch <- 2 // 第二次发送永久阻塞（Channel已满且无接收者）
        fmt.Println("第二次发送成功（永远不会执行）")
    }()

    time.Sleep(500 * time.Millisecond)
    fmt.Println("接收到:", <-ch) // 只消费一次数据

    // 监控Goroutine数量
    for {
        fmt.Printf("当前Goroutine数量: %d\n", runtime.NumGoroutine()) // 2
        time.Sleep(1 * time.Second)
    }
}
```

[在线运行](https://go.dev/play/p/ZY9038_1BYW)


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/posts/channel_may_cause_goroutine_leak/  

