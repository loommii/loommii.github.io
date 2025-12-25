---
date: '2024-12-06T19:49:55+08:00'
draft: false
title: 'Go每日一题_028'
---
下面这段代码能否编译通过？如果可以，输出什么？

```go
const (
    x = iota
    _
    y
    z = "zz"
    k 
    p = iota
)

func main()  {
    fmt.Println(x,y,z,k,p)
}

```

{{< togglecontent label="🔑 答案解析：" >}}

参考答案：编译通过，输出：0 2 zz zz 5

const 定义的时候 若变量后未跟随值将会沿用上一个变量的值

```go
const (
    x = iota
    _ = iota
    y = iota
    z = "zz"
    k = "zz"
    p = iota
)
```

iota 相当于const语句块的行索引

```go
const (
    x = 0
    _ = 1
    y = 2
    z = "zz"
    k = "zz"
    p = 5
)
```

{{< /togglecontent >}}
