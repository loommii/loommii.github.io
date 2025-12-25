---
date: '2025-02-18T00:15:12+08:00'
draft: false
title: 'Go每日一题_189'
---
如果 Add() 函数的调用代码为：

```go
func main() {
    var a Integer = 1
    var b Integer = 2
    var i interface{} = &a
    sum := i.(*Integer).Add(b)
    fmt.Println(sum)
}
```

则Add函数定义正确的是：

```go
A.
type Integer int
func (a Integer) Add(b Integer) Integer {
        return a + b
}

B.
type Integer int
func (a Integer) Add(b *Integer) Integer {
        return a + *b
}

C.
type Integer int
func (a *Integer) Add(b Integer) Integer {
        return *a + b
}

D.
type Integer int
func (a *Integer) Add(b *Integer) Integer {
        return *a + *b
}
```

{{< togglecontent label="🔑 答案解析：" >}}

A C

从代码i.(*Integer).Add(b) 就可以得出C答案是一定符合的。  
A代码 接收者类型：值类型 Integer，但可通过指针调用（Go 自动解引用`*Integer`为 Integer）。
因此A代码也合法。

[Go官方文档-Method_values](https://go.dev/ref/spec#Method_values)

{{< /togglecontent >}}
