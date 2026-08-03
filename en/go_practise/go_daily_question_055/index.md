# Go Daily Question 055


What is the output of the following code?

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

{{< details summary="🔑 Answer Analysis:" >}}

Answer: 5
The parameters of the `hello()` function save a copy when the `defer` statement is executed, and this copy is used when the `hello()` function is actually called. Therefore, it is 5.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_055/  

