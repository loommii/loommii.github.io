# Go每日一题_219


下面这段代码输出什么？

```go
func main() {  
    i := -5
    j := +5
    fmt.Printf("%+d %+d", i, j)
}
```

A. -5 +5
B. +5 +5
C. 0 0
{{< details summary="🔑 答案解析：" >}}

A
%d表示输出十进制数字，+表示输出数值的符号。这里不表示取反。
%d 输出 正数不会输出符号 +

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_219/  

