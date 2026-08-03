# Go Daily Question 115


Which of the following calls to the `add()` function are correct?

```go
func add(args ...int) int {
    sum := 0
    for _, arg := range args {
        sum += arg
    }
    return sum
}
```

A. add(1, 2)
B. add(1, 3, 7)
C. add([]int{1, 2})
D. add([]int{1, 3, 7}...)
{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: ABD.

Key takeaway: Variadic functions.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_115/  

