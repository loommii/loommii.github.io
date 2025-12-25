---
date: '2024-12-06T20:44:22+08:00'
draft: false
title: 'Go每日一题_044'
---
以下代码有什么问题，怎么解决？

```go
total, sum := 0, 0
for i := 1; i <= 10; i++ {
    sum += i
    go func() {
        total += i
    }()
}
fmt.Printf("total:%d sum %d", total, sum)
```

{{< togglecontent label="🔑 答案解析：" >}}

sum 的值 55
total 的值 55 - 100 之前

考点一：
知道输出的效果是什么，且知道如何解决。
考点二：
data race。因为存在多 goroutine 同时写 total 变量的问题，所以有数据竞争。
考点三：
main 函数先退出了，开启的 goroutine 根本没有机会执行。

{{< /togglecontent >}}
