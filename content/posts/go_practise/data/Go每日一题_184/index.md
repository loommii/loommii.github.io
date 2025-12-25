---
date: '2025-02-13T00:20:25+08:00'
draft: false
title: 'Go每日一题_184'
---
关于类型转化，下面选项正确的是？

```go
A.
type MyInt int
var i int = 1
var j MyInt = i

B.
type MyInt int
var i int = 1
var j MyInt = (MyInt)i

C.
type MyInt int
var i int = 1
var j MyInt = MyInt(i)

D.
type MyInt int
var i int = 1
var j MyInt = i.(MyInt)
```

{{< togglecontent label="🔑 答案解析：" >}}

C

```go
type MyInt int // 定义一个类型别名
var i int = 1  // 声明并赋值变量i 值为 1
// A
var j MyInt = i // 错误，因为变量i的类型为int，而变量j的类型为MyInt，它们不是同一种类型，不能直接赋值。
// B
var j MyInt = (MyInt)i // 错误,C/C++ 风格的强制转换语法，在 Go 中无效
// C
var j MyInt = MyInt(i) // 正确,Go 的类型转换语法，将变量i转换为MyInt类型
// D
var j MyInt = i.(MyInt) // 错误, 这是Go 类型断言语法,断言使用在空接口或any上。
```

{{< /togglecontent >}}
