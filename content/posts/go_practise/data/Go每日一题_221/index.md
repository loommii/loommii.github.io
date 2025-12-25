---
date: '2025-05-03T00:36:48+08:00'
draft: false
title: 'Go每日一题_221'
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
    c := Work{3}
    var a A = c
    var b B = c
    fmt.Println(a.ShowB())
    fmt.Println(b.ShowA())
}
```

A. 23 13
B. compilation error
{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：B。

a接口没有ShowB方法
b接口没有ShowA方法
因此编译不通过

{{< /togglecontent >}}
