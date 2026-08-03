# Go Daily Question 102


What is the output of the following code?

```go
func change(s ...int) {
    s = append(s,3)
}

func main() {
    slice := make([]int,5,5)
    slice[0] = 1
    slice[1] = 2
    change(slice...)
    fmt.Println(slice)
    change(slice[0:2]...)
    fmt.Println(slice)
}

```

{{< details summary="🔑 Answer Analysis:" >}}

```
[1 2 0 0 0]
[1 2 3 0 0]
```

Key takeaways: variadic functions, append() operation.

Go's syntactic sugar `...` allows passing a slice into a variadic function without creating a new slice. When `change()` is called the first time, the `append()` operation causes the underlying array of the slice to reallocate (grow), and the original slice's underlying array remains unchanged. When `change()` is called the second time, a new slice, let's call it `slice1`, is obtained using the operator `[i:j]`. Its underlying array overlaps with the original slice's underlying array. However, `slice1`'s length and capacity are 2 and 5 respectively, so modifications to `slice1`'s underlying array within the `change()` function will affect the original slice.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_102/  

