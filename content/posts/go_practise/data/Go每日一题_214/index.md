---
date: '2025-04-12T11:40:26+08:00'
draft: false
title: 'Go每日一题_214'
---
unc main() {
    a := [2]int{5, 6}
    b := [3]int{5, 6}
    if a == b {
        fmt.Println("equal")
    } else {
        fmt.Println("not equal")
    }
}
```

- A. compilation error
- B. equal
- C. not equal

{{< togglecontent label="🔑 答案解析：" >}}

[在线运行](https://go.dev/play/p/rNBNzx3dOUY)
A  [2]int 和 [3]int 在Go中是不同的类型 不能通过 == 运算符对比
>./prog.go:8:10: invalid operation: a == b (mismatched types [2]int and [3]int)

{{< /togglecontent >}}
