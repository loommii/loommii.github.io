# Go Daily Question 139


Which of the following types can use the `cap()` function?

- A. array
- B. slice
- C. map
- D. channel

{{< details summary="🔑 Answer Analysis:" >}}

ABD
[Official documentation](https://pkg.go.dev/builtin#cap)

```go
func cap(v Type) int
// The built-in function `cap` returns the capacity of `v` based on its type:
```

> - Array: the number of elements in `v` (same as `len(v)`).
> - Pointer to array `*array`: the number of elements in `*v` (same as `len(v)`).
> - Slice: the maximum length the slice can reach when re-sliced;
> - Channel: the buffer capacity of the channel, in terms of elements;
> - If `v` is `nil`, then `cap(v)` is zero.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_139/  

