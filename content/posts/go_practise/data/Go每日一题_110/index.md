---
date: '2024-12-06T23:42:50+08:00'
draft: false
title: 'Go每日一题_110'
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

AC
如果是func (a Integer) 编译会自动帮你添加 func (a *Integer)
反过来则不行

{{< /togglecontent >}}
