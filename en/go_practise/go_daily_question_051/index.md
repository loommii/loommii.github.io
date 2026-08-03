# Go Daily Question 051


What is the output of the following code?

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
{{< details summary="🔑 Answer Analysis:" >}}

A
`%d` indicates outputting a decimal number, and `+` indicates outputting the sign of the number. It does not mean negation here.
`%d` output for positive numbers will not include the `+` sign by default.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_051/  

