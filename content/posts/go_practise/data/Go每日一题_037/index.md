---
date: '2024-12-06T20:44:14+08:00'
draft: false
title: 'Go每日一题_037'
---
执行下面的代码会发生什么？

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch := make(chan int, 1000)
    go func() {
        for i := 0; i < 10; i++ {
            ch <- i
        }
    }()
    go func() {
        for {
            a, ok := <-ch
            if !ok {
                fmt.Println("close")
                return
            }
            fmt.Println("a: ", a)
        }
    }()
    close(ch)
    fmt.Println("ok")
    time.Sleep(time.Second * 100)
}

```

{{< togglecontent label="🔑 答案解析：" >}}
答
输出"ok"后panic
启动协程需要时间,这里程序运行close(ch)一句关闭channel了,往已关闭的channel写数据会导致程序panic

{{< /togglecontent >}}
