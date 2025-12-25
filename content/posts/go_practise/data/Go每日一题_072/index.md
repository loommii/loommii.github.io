---
date: '2024-12-06T20:44:55+08:00'
draft: false
title: 'Go每日一题_072'
---
下面代码输出什么？

```go
type A interface {
    ShowA() int
}

type B interface {
    ShowB() int
}

type Work struct {
    i int
}

func (w Work) ShowA() int {
    return w.i + 10
}

func (w Work) ShowB() int {
    return w.i + 20
}

func main() {
    var a A = Work{3}
    s := a.(Work)
    fmt.Println(s.ShowA())
    fmt.Println(s.ShowB())
}
```

A. 13 23
B. compilation error
{{< togglecontent label="🔑 答案解析：" >}}

A ：类型断言。
无坑

{{< /togglecontent >}}
