---
date: '2024-12-06T23:42:56+08:00'
draft: false
title: 'Go每日一题_115'
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

A. add(1, 2)
B. add(1, 3, 7)
C. add([]int{1, 2})
D. add([]int{1, 3, 7}...)
{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：ABD。

知识点：可变函数。

{{< /togglecontent >}}
