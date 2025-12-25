---
date: '2025-01-11T23:04:42+08:00'
draft: false
title: 'Go每日一题_158'
---
下面代码输出什么？

```go
package main

import "fmt"

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

- A. 23 13
- B. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

B [在线运行](https://go.dev/play/p/yz3LsE6kw-U)

A接口没有ShowB方法
B接口没有ShowA方法

{{< /togglecontent >}}
