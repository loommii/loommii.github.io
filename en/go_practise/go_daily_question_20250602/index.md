# Go Daily Question 20250602


Will the following code terminate normally?

```go
func main() {
    v := []int{1, 2, 3}
    for i := range v {
        v = append(v, i)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

It will not result in an infinite loop and will terminate normally.

The number of iterations is determined before the loop starts. Changing the length of the slice within the loop does not affect the number of iterations.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250602/  

