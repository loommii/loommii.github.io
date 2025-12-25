---
date: '2025-05-14T14:51:02+08:00'
draft: false
title: 'Go每日一题_20250514'
---
A、B、C、D 哪些选项有语法错误？

```go
type S struct {
}

func f(x interface{}) {
}

func g(x *interface{}) {
}

func main() {
       s := S{}
       p := &s
       f(s) //A
       g(s) //B
       f(p) //C
       g(p) //D
}
```

{{< togglecontent label="🔑 答案解析：" >}}

BD [在线运行](https://go.dev/play/p/sXFam1hdBhS)

函数参数为 interface{} 时可以接收任何类型的参数，包括用户自定义类型等，即使是接收指针类型也用 interface{}，而不是使用 *interface{}。
> 永远不要使用一个指针指向一个接口类型，因为它已经是一个指针。

参数为 *interface{} 时，只能接受空接口的指针，而不是任何类型

```go
func g(x *interface{}) {
}

func main() {
       s := S{}
       p := &s
       f(s) //A
       var r interface{} = p
       g(&r) //D
}
```

例如这样 D就不会报错了，但是不建议这样使用

{{< /togglecontent >}}
