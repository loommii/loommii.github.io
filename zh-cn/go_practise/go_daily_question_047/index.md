# Go每日一题_047


下面这段代码输出什么？

```go
func main() {
    a := [2]int{5, 6}
    b := [3]int{5, 6}
    if a == b {
        fmt.Println("equal")
    } else {
        fmt.Println("not equal")
    }
}
```

A. compilation error
B. equal
C. not equal
{{< details summary="🔑 答案解析：" >}}

A
只有同容量，同类型的数组才能比较

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_047/  

