# Go每日一题_084


下面这段代码输出什么？为什么？

```go
func main() {
    s1 := []int{1, 2, 3}
    s2 := s1[1:]
    s2[1] = 4
    fmt.Println(s1)
    s2 = append(s2, 5, 6, 7)
    fmt.Println(s1)
}

```

{{< details summary="🔑 答案解析：" >}}

s1 [1,2,4]
s2 [2,4,5,6,7]

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_084/  

