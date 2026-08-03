# Go每日一题_101


下面这段代码输出什么？

```go
func main() {
    var a = [5]int{1, 2, 3, 4, 5}
    var r [5]int

    for i, v := range a {
        if i == 0 {
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
    fmt.Println("r = ", r)
    fmt.Println("a = ", a)
}
```

{{< details summary="🔑 答案解析：" >}}
r =  [1 2 3 4 5]
a =  [1 12 13 4 5]
range 表达式是副本参与循环，就是说例子中参与循环的是 a 的副本，而不是真正的 a。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_101/  

