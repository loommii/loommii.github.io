# Go Daily Question 091


What is the output of the following code?

```go
const (
    a = iota
    b = iota
)
const (
    name = "name"
    c    = iota
    d    = iota
)
func main() {
    fmt.Println(a)
    fmt.Println(b)
    fmt.Println(c)
    fmt.Println(d)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: 0 1 1 2.

Key takeaway: Usage of iota.

`iota` is Go language's constant counter, and can only be used in constant expressions.

`iota` is reset to 0 when the `const` keyword appears, and each new line of constant declaration in a `const` block increments `iota` by one.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_091/  

