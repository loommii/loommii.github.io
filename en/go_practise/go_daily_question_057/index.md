# Go Daily Question 057


Which of the following options is correct?

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
{{< details summary="🔑 Answer Analysis:" >}}

Reference code and analysis: C.

Key takeaway: Strings in Go are read-only.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_057/  

