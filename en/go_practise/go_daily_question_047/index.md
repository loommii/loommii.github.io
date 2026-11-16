# Go Daily Question 047


What is the output of the following code?

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
{{< details summary="🔑 Answer Analysis:" >}}

A
Only arrays of the same capacity and same type can be compared.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_047/  

