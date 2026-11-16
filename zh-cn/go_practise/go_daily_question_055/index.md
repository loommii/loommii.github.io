# Go每日一题_055


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

{{< details summary="🔑 答案解析：" >}}

答 5
hello() 函数的参数在执行 defer 语句的时候会保存一份副本，在实际调用 hello() 函数时用，所以是 5.

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_055/  

