---
date: '2024-12-06T20:44:40+08:00'
draft: false
title: 'Go每日一题_059'
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

答 ABD

虽然 ... 本质上也是个 切片 但是不能使用C这种方式

{{< /togglecontent >}}
