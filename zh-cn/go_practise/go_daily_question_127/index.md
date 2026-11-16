# Go每日一题_127


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

- A. nil
- B. not nil
- C. compilation error

{{< details summary="🔑 答案解析：" >}}

B
> hello 是个Function values.函数在GO中时一等公民。因此可以 if h == nil
有应为Function values.有值(地址)因此也不为nil
函数也是值。它们可以像其他值一样传递。
函数值可以用作函数参数和返回值。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_127/  

