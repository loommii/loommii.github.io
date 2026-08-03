# Go Daily Question 114


Will the following code compile? If so, what will be the output?

```go
func main() {
    s1 := []int{1, 2, 3}
    s2 := []int{4, 5}
    s1 = append(s1, s2)
    fmt.Println(s1)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: It will not compile. The second argument of `append()` cannot directly use a slice; it requires the `...` operator to append one slice to another: `append(s1, s2...)`. Alternatively, elements can be appended directly, such as: `append(s1, 1, 2, 3)`.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_114/  

