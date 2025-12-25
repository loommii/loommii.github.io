---
date: '2024-12-06T20:45:18+08:00'
draft: false
title: 'Go每日一题_091'
---
下面这段代码输出什么？

```go
const (
    a = iota
    b = iota
)
const (
    name = "name"
    c    = iota
    d    = iota
)
func main() {
    fmt.Println(a)
    fmt.Println(b)
    fmt.Println(c)
    fmt.Println(d)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：0 1 1 2。

知识点：iota 的用法。

iota 是 golang 语言的常量计数器，只能在常量的表达式中使用。

iota 在 const 关键字出现时将被重置为0，const中每新增一行常量声明将使 iota 计数一次。

{{< /togglecontent >}}
