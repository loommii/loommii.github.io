---
date: '2025-05-30T15:26:33+08:00'
draft: false
title: 'Go每日一题_20250530'
---
以下代码的输出结果：
```go
package main

import "sync"

func main() {
	var wg sync.WaitGroup
	foo := make(chan int)
	bar := make(chan int)
	wg.Add(1)
	go func() {
		defer wg.Done()
		select {
		case foo <- <-bar:
		default:
			println("default")
		}
	}()
	wg.Wait()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

## 正确答案：** 死锁（无输出，程序卡住）**

### 解析：

这段代码会**死锁**，不会输出 "default"，也不会 panic，而是程序会卡住无法继续执行。原因如下：

1. **`select` 语句的求值顺序**：
   - 在进入 `select` 时，Go 会先按顺序评估所有 case 的表达式
   - 对于 `case foo <- <-bar:`，会先评估 `<-bar`（发送操作的右侧表达式）

2. **通道操作阻塞**：
   - `bar` 是无缓冲通道，且没有其他 goroutine 向它发送数据
   - `<-bar` 会一直阻塞，等待数据
   - 由于评估 case 表达式时阻塞了，整个 `select` 语句无法继续执行

3. **`default` 不会执行**：
   - 由于 `select` 在评估 case 表达式时就阻塞了，根本来不及检查是否有 `default` case
   - 因此不会执行 `default` 分支

4. **死锁形成**：
   - 主 goroutine 在 `wg.Wait()` 等待
   - 子 goroutine 在 `select` 评估时阻塞
   - 没有其他 goroutine 可以解除这种阻塞状态
   - 最终所有 goroutine 都阻塞，形成死锁

### 验证方法：
你可以运行这个程序，会发现程序没有任何输出，也不会退出，而是卡在那里（死锁状态）。

### 正确写法：
如果想避免死锁，应该确保通道操作不会在评估时就阻塞，例如：
```go
select {
case v := <-bar:  // 先单独接收
    foo <- v      // 然后发送
default:
    println("default")
}
```

{{< /togglecontent >}}
