---
date: '2024-12-06T23:42:57+08:00'
draft: false
title: 'Go每日一题_116'
---
下面这段代码输出什么？

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
    fmt.Println(a.ShowA())
    fmt.Println(b.ShowB())
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答 可以成功编译 且输出 13 和 23

```
    c := Work{3} // 这里声明了变量c 并且赋值了结构体 Work{3}
    var a A = c // 因为A 是接口，这里要看c结构体 Work是否实现了接口A要求的函数ShowA() int。这题是有func (w Work) ShowA() int { 因此是可以正确的赋值的。
    var b B = c// 与A同理
    fmt.Println(a.ShowA())  // a接口下有ShowA 因此也可以成功调用
    fmt.Println(b.ShowB()) //与a同理
```

{{< /togglecontent >}}
