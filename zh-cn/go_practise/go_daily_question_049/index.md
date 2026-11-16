# Go每日一题_049


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

{{< details summary="🔑 答案解析：" >}}
A
接口类型 当动态值和动态类型都为 nil 时，接口类型值才为 nil。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_049/  

