---
date: '2024-12-06T20:44:26+08:00'
draft: false
title: 'Go每日一题_047'
---
下面这段代码输出什么？

```go
func main() {
    a := [2]int{5, 6}
    b := [3]int{5, 6}
    if a == b {
        fmt.Println("equal")
    } else {
        fmt.Println("not equal")
    }
}
```

A. compilation error
B. equal
C. not equal
{{< togglecontent label="🔑 答案解析：" >}}

A
只有同容量，同类型的数组才能比较

{{< /togglecontent >}}
