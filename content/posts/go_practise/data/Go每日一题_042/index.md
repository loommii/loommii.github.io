---
date: '2024-12-06T20:44:20+08:00'
draft: false
title: 'Go每日一题_042'
---
下面这段代码输出什么？

```go
func main() {  
    a := 5
    b := 8.1
    fmt.Println(a + b)
}
```

A.13.1
B.13
C.compilation error

{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：C。a 的类型是 int，b 的类型是 float，两个不同类型的数值不能相加，编译报错。

{{< /togglecontent >}}
