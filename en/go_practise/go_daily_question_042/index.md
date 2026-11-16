# Go Daily Question 042


What is the output of the following code?

```go
func main() {  
    a := 5
    b := 8.1
    fmt.Println(a + b)
}
```

A.13.1
B.13
C.compilation error

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: C. The type of `a` is `int`, and the type of `b` is `float`. Two numerical values of different types cannot be added, resulting in a compilation error.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_042/  

