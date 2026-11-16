# Go Daily Question 065


What are the length and capacity of slices a, b, and c respectively?

```go
func main() {
    s := [3]int{1, 2, 3}
    a := s[:0]
    b := s[:2]
    c := s[1:2:cap(s)]
}
```

{{< details summary="🔑 Answer Analysis:" >}}

a: len 0, cap 3
b: len 2, cap 3
c: len 1, cap 2

c starts at index 1.

Reference Answer and Analysis: The length and capacity of a, b, and c are 0 3, 2 3, and 1 2, respectively.

Key takeaway: Array or slice slicing operations. Slicing operations can take 2 or 3 parameters, such as `[i:j]` and `[i:j:k]`. Assuming the length of the underlying array of the sliced object is `l`. In the operator `[i:j]`, if `i` is omitted, it defaults to 0; if `j` is omitted, it defaults to the length of the underlying array. The calculated length and capacity of the resulting slice are `j-i` and `l-i`. In the operator `[i:j:k]`, `k` is mainly used to limit the capacity of the slice, but it cannot be greater than the length of the array `l`. The calculated length and capacity of the resulting slice are `j-i` and `k-i`.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_065/  

