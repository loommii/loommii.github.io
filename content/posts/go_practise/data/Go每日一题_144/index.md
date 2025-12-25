---
date: '2024-12-27T23:14:28+08:00'
draft: false
title: 'Go每日一题_144'
---
下面这段代码输出什么？

```go
type People struct{}

func (p *People) ShowA() {
    fmt.Println("showA")
    p.ShowB()
}
func (p *People) ShowB() {
    fmt.Println("showB")
}

type Teacher struct {
    People
}

func (t *Teacher) ShowB() {
    fmt.Println("teacher showB")
}

func main() {
    t := Teacher{}
    t.ShowB()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```text
teacher showB
```

[在线运行](https://go.dev/play/p/dnitHoT5yHi)

### 知识点：结构体嵌套  

Teacher struct 内嵌套了People struct
在嵌套结构体中，People 称为内部类型，Teacher 称为外部类型；通过嵌套，内部类型的属性、方法，可以为外部类型所有，就好像是外部类型自己的一样。此外，外部类型还可以定义自己的属性和方法，甚至可以定义与内部相同的方法，这样内部类型的方法就会被“屏蔽”。这个例子中的 ShowB() 就是同名方法。

如果想要调用People的ShowB() 方法需要使用

```go
t.People.ShowB()
```

[在线运行](https://go.dev/play/p/oi34XpDskH2)

t.People.ShowA() 等价 t.ShowA()
因为Teacher没有ShowA()方法，因此可以省略。这是Go提供的语法糖

```go
// 二者等价
t.People.ShowA()
t.ShowA()
```

[在线运行](https://go.dev/play/p/RZ0M-MjpMcM)

{{< /togglecontent >}}
