---
date: '2024-12-06T20:44:12+08:00'
draft: false
title: 'Go每日一题_036'
---
下面这段代码能否编译通过？如果可以，输出什么？

```go
func GetValue() int {
    return 1
}

func main() {
    i := GetValue()
    switch i.(type) {
    case int:
        println("int")
    case string:
        println("string")
    case interface{}:
        println("interface")
    default:
        println("unknown")
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答 编译错误
这里使用到了 类型断言。 但是注意只有接口类型才能进行类型断言。 i.(type)，这里i 的类型是 int 而不是 接口
{{< /togglecontent >}}
