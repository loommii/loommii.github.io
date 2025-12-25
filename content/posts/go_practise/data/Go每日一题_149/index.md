---
date: '2025-01-02T00:17:12+08:00'
draft: false
title: 'Go每日一题_149'
---
对 add() 函数调用正确的是？

```go
func add(args ...int) int {
    sum := 0
    for _, arg := range args {
        sum += arg
    }
    return sum
}
```

- A. add(1, 2)
- B. add(1, 3, 7)
- C. add([]int{1, 2})
- D. add([]int{1, 3, 7}...)

{{< togglecontent label="🔑 答案解析：" >}}

A B D
[在线运行](https://go.dev/play/p/869njWxkuwY)

[Go官方文档-Passing_arguments_to_..._parameters](https://golang.google.cn/ref/spec#Passing_arguments_to_..._parameters)

add 是一个可变参数函数，接受任意数量的 int 类型参数。  
参数 args 的类型是 ...int，在函数内部表现为 []int（即一个 int 类型的切片）。  
虽然 []int 和 ...int 在底层都是切片，但 Go 语言的类型系统要求显式地将切片展开为可变参数。  

{{< /togglecontent >}}
