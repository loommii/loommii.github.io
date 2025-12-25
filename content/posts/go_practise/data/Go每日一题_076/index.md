---
date: '2024-12-06T20:45:00+08:00'
draft: false
title: 'Go每日一题_076'
---
下面这段代码正确的输出是什么？

```go
func f() {
    defer fmt.Println("D")
    fmt.Println("F")
}

func main() {
    f()
    fmt.Println("M")
}
```

{{< togglecontent label="🔑 答案解析：" >}}

FDM

{{< /togglecontent >}}
