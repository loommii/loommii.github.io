---
date: '2024-12-13T15:43:57+08:00'
draft: false
title: 'Go每日一题_130'
---
以下代码有什么问题？

```go
package main

import (
    "sync"
)

const N = 10

var wg = &sync.WaitGroup{}

func main() {
    for i := 0; i < N; i++ {
        go func(i int) {
            wg.Add(1)
            println(i)
            defer wg.Done()
        }(i)
    }
    wg.Wait()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

运行后的现象为什么都没有输出
WaitGroup(等待组)的目的是用于等待一组协程的结束。
内部会维护一个计数器
Add方法向内部计数加上delta
Done方法减少WaitGroup计数器的值
Wait方法阻塞直到WaitGroup计数器减为0。

本题中,for 循环中go func 创建协程。
在协程运行是执行wg.Add(1)和wg.Done()

而在子goroutine运行前，主goroutine已经运行到wg.Wait()。这时候计数器为0因此不阻塞，main goroutine 结束后，进程结束。
因此子goroutine没有输出内容

修改：

```go
func main() {
    for i := 0; i < N; i++ {
        wg.Add(1) // 1. ADD放到主goroutine中
        go func(i int) {
            defer wg.Done() // 2. 建议一进来就执行defer wg.Done(),预防panic导致Done方法未执行
            println(i)
        }(i)
    }
    wg.Wait()
}
```

{{< /togglecontent >}}
