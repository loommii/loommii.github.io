# Go Daily Question 076


What is the correct output of the following code?

```go
func f() {
    defer fmt.Println("D")
    fmt.Println("F")
}

func main() {
    f()
    fmt.Println("M")
}
```

{{< details summary="🔑 Answer Analysis:" >}}

FDM

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_076/  

