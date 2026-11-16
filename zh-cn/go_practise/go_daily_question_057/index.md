# Go每日一题_057


下列选项正确的是？

```go
func main() {
    str := "hello"
    str[0] = 'x'
    fmt.Println(str)
}
```

A. hello
B. xello
C. compilation error
{{< details summary="🔑 答案解析：" >}}

参考代码及解析：C。

知识点：Go 语言中的字符串是只读的。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_057/  

