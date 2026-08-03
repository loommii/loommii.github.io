# Go每日一题_20250601


下面这段代码输出什么？

```go
var p *int

func foo() (*int, error) {
    var i int = 5
    return &i, nil
}

func bar() {
    //use p
    fmt.Println(*p)
}

func main() {
    p, err := foo()
    if err != nil {
        fmt.Println(err)
        return
    }
    bar()
    fmt.Println(*p)
}
```

A. 5 5
B. runtime error

{{< details summary="🔑 答案解析：" >}}

B
 全局的 *p 是nil
p, err := foo() 这里是一个新的p 局部变量 与全局的p无关

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_20250601/  

