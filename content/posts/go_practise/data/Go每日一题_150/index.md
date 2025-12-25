---
date: '2025-01-03T13:55:19+08:00'
draft: false
title: 'Go每日一题_150'
---
以下代码输出什么？

```go
package main

import (
       "fmt"
       "time"
)

func main() {
       ch1 := make(chan int)
       go fmt.Println(<-ch1)
       ch1 <- 5
       time.Sleep(1 * time.Second)
}
```

- A：5
- B：不能编译
- C：运行时死锁

{{< togglecontent label="🔑 答案解析：" >}}

C [在线运行](https://go.dev/play/p/FsQsswPtOpp)
>fatal error: all goroutines are asleep - deadlock!

官方对[Go语句](https://go.dev/ref/spec#Go_statements)的描述
>go 语句用于启动一个新的 Goroutine（并发执行的线程），并在其中执行一个函数调用。

The function value and parameters are evaluated as usual in the calling goroutine, but unlike with a regular call, program execution does not wait for the invoked function to complete.
> 函数值和参数会按照常规方式在调用 Goroutine 中求值。但与常规的函数调用不同，程序不会等待被调用的函数执行完成。

本题目中通过go语句新的 Goroutine 去运行fmt.Println。（即 <-ch1 的值）会传递给 fmt.Println，并在 Goroutine b 中执行。

- main Goroutine 在 go fmt.Println(<-ch1) 中求值 <-ch1 时被阻塞。
- 由于 ch1 是无缓冲通道，且没有其他 Goroutine 向 ch1 发送数据，<-ch1 会一直阻塞。
- main Goroutine 被阻塞后，程序无法继续执行，最终触发死锁。

{{< /togglecontent >}}
