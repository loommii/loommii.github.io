---
date: '2024-12-06T20:44:28+08:00'
draft: false
title: 'Go每日一题_049'
---
下面这段代码输出什么？

```go
func main() {  
    var i interface{}
    if i == nil {
        fmt.Println("nil")
        return
    }
    fmt.Println("not nil")
}
```

A. nil
B. not nil
C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}
A
接口类型 当动态值和动态类型都为 nil 时，接口类型值才为 nil。

{{< /togglecontent >}}
