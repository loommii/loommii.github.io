# Go Daily Question 138


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

- A. compilation error
- B. equal
- C. not equal

{{< details summary="🔑 Answer Analysis:" >}}

[Run online](https://go.dev/play/p/rNBNzx3dOUY)
A. `[2]int` and `[3]int` are different types in Go and cannot be compared using the `==` operator.
>./prog.go:8:10: invalid operation: a == b (mismatched types [2]int and [3]int)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_138/  

