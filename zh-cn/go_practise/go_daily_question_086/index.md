# Go每日一题_086


下面这段代码输出什么？

```go
func main() {
    m := map[int]string{0:"zero",1:"one"}
    for k,v := range m {
        fmt.Println(k,v)
    }
}
```

{{< details summary="🔑 答案解析：" >}}

```
0 zero
1 one
// 或者
1 one
0 zero
```

map 的输出是无序的。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_086/  

