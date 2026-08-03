# Go Daily Question 019

Will the following code compile? If not, what is the reason? If it compiles, what will be the output?

```go
func main() {
    list := new([]int)
    list = append(list, 1)
    fmt.Println(list)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: Cannot compile.
The type of `list` is a pointer of type `*[]int`.
The first parameter of `append` must be a slice, not the address of a slice.

You can initialize it with `make()` before use. Similarly, for `map` and `channel`, it is recommended to initialize them using `make()` or literal syntax, and not `new()`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_019/  

