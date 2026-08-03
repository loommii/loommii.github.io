# Go Daily Question 149


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

- A. add(1, 2)
- B. add(1, 3, 7)
- C. add([]int{1, 2})
- D. add([]int{1, 3, 7}...)

{{< details summary="🔑 Answer Analysis:" >}}

A, B, D
[Run online](https://go.dev/play/p/869njWxkuwY)

[Go Official Documentation - Passing arguments to ... parameters](https://golang.google.cn/ref/spec#Passing_arguments_to_..._parameters)

`add` is a variadic function that accepts any number of `int` type arguments.
The type of the `args` parameter is `...int`, which behaves as `[]int` (an `int` type slice) inside the function.
Although `[]int` and `...int` are both slices at the underlying level, Go's type system requires explicitly unpacking a slice as variadic parameters.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_149/  

