---
date: '2024-12-06T20:45:23+08:00'
draft: false
title: 'Go每日一题_095'
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

A：default
B：panic
{{< togglecontent label="🔑 答案解析：" >}}

按常规理解，go func 中的 select 应该执行 default 分支，程序正常运行。但结果却不是，而是死锁。可以通过该链接测试：<https://play.studygolang.com/p/kF4pOjYXbXf。>

原因文章也解释了，Go 语言规范中有这么一句：
> For all the cases in the statement, the channel operands of receive operations and the channel and right-hand-side expressions of send statements are evaluated exactly once, in source order, upon entering the “select” statement. The result is a set of channels to receive from or send to, and the corresponding values to send. Any side effects in that evaluation will occur irrespective of which (if any) communication operation is selected to proceed. Expressions on the left-hand side of a RecvStmt with a short variable declaration or assignment are not yet evaluated.

回到这个题上 case foo <- <-bar:
这里不管 select 选择了 哪一个case 会后先 执行<-bar 导致panic

{{< /togglecontent >}}
