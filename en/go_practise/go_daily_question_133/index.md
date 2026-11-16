# Go Daily Question 133


What is the output of the following code?

```go
func hello(num ...int) {  
    num[0] = 18
}

func main() {  
    i := []int{5, 6, 7}
    hello(i...)
    fmt.Println(i[0])
}
```

A.18
B.5
C.Compilation error

{{< details summary="🔑 Answer Analysis:" >}}

Answer: 18

Go parameters are always passed by value. Each function call creates a new copy, and the value of the copy is equal to the original value.
`...int` is essentially a slice. A slice's structure is `cap len underlying_array_pointer`.

Therefore, the value content of `num ...int` and `i...` are the same, but their variable addresses are different.

In the problem, no resizing is triggered, so the two slices point to the same underlying array. Thus, `num[0] = 18` affects the outer `i[0]`.

Run online:
>This problem: <https://go.dev/play/p/ne8bmUzhqsN>
>
>Modification after `num` triggered expansion: <https://go.dev/play/p/Y3BhAEj3CjL>
>
>Deep copy slice using `copy`: <https://go.dev/play/p/QZwRA6jL48z>

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_133/  

