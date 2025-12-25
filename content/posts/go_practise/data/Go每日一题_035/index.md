---
date: '2024-12-06T20:44:11+08:00'
draft: false
title: 'Go每日一题_035'
---
下面这段代码输出什么以及原因？

```go
func hello() []string {  
    return nil
}

func main() {  
    h := hello
    if h == nil {
        fmt.Println("nil")
    } else {
        fmt.Println("not nil")
    }
}
```

A. nil
B. not nil
C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

B。这道题目里面，是将函数 hello 赋值给变量 h，而不是函数的返回值（即不是进行函数调用），所以输出 not nil。注意 Go 中函数是一等公民。

如果修改为

```go
func hello() []string {  
    return nil
}

func main() {  
    h := hello()
    if h == nil {
        fmt.Println("nil")
    } else {
        fmt.Println("not nil")
    }
}
```

答案才能为A

{{< /togglecontent >}}
