---
date: '2024-12-17T14:00:22+08:00'
draft: false
title: 'Go每日一题_134'
---
下面这段代码输出什么？

```go
func main() {  
    a := 5
    b := 8.1
    fmt.Println(a + b)
}
```

- A.13.1
- B.13
- C.compilation error

{{< togglecontent label="🔑 答案解析：" >}}

答 C 在线运行:<https://go.dev/play/p/VDTgpXoukTb>

在Go中，变量之间没有隐式类型转换。但是，编译器可以进行变量和常量之间的隐式类型转换

题目中 a为 int变量 b为 float64变量\

不同类型不能使用 + 运算符

常量之间的隐式类型转换

```go
func main() {
    const a = 5
    const b = 8.1
    fmt.Println(a + b) // 13.1
}
```

在线运行 ：<https://go.dev/play/p/4KXch9jes-y>

类型的优先级为： 整数(int)<符文数(rune)<浮点数(float)<复数(Imag)

```go
func main() {
    a := 5
    const b = 8.1
    fmt.Println(a + b) // 报错
}
```

在线运行：<https://go.dev/play/p/sIINDSsakdz>
变量A int 变量b不能被推断为int

```go
func main() {
    const a = 5
    b := 8.1
    fmt.Println(a + b) // 13.1
}
```

在线运行：<https://go.dev/play/p/JNhNXc1OErN>

{{< /togglecontent >}}
