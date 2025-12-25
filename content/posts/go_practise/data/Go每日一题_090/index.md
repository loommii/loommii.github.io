---
date: '2024-12-06T20:45:17+08:00'
draft: false
title: 'Go每日一题_090'
---
下面这段代码输出什么？为什么？

```go
type People interface {
    Speak(string) string
}

type Student struct{}

func (stu *Student) Speak(think string) (talk string) {
    if think == "speak" {
        talk = "speak"
    } else {
        talk = "hi"
    }
    return
}

func main() {
    var peo People = Student{}
    think := "speak"
    fmt.Println(peo.Speak(think))
}

```

A. speak
B. compilation error

{{< togglecontent label="🔑 答案解析：" >}}
B
编译错误 Student does not implement People (Speak method has pointer receiver)，值类型 Student 没有实现接口的 Speak() 方法，而是指针类型 *Student 实现改方法。

{{< /togglecontent >}}
