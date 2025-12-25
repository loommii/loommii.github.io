---
date: '2024-12-06T20:44:35+08:00'
draft: false
title: 'Go每日一题_055'
---
下面这段代码输出什么?

```go
func hello(i int) {  
    fmt.Println(i)
}
func main() {  
    i := 5
    defer hello(i)
    i = i + 10
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答 5
hello() 函数的参数在执行 defer 语句的时候会保存一份副本，在实际调用 hello() 函数时用，所以是 5.

[>Golang中的Defer必掌握的7知识点](:/b738512884944749b814f27444efcd2c)

{{< /togglecontent >}}
