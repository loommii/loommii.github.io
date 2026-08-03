# Go Daily Question 099


What is the output of the following code? Why?

```go
func main() {

    var m = [...]int{1, 2, 3}

    for i, v := range m {
        go func() {
            fmt.Println(i, v)
        }()
    }

    time.Sleep(time.Second * 3)
}
```

{{< details summary="🔑 Answer Analysis:" >}}
Before Go 1.22, the output would be:
2 3
2 3
2 3
The `for range` loop uses short variable declaration (`:=`) to iterate variables. It's important to note that variables `i` and `v` are reused in each loop iteration, not re-declared.

The `i` and `v` values output in each goroutine are the final values of `i` and `v` after the `for range` loop finishes, not the values of `i` and `v` at the time each goroutine was launched. This can be understood as a closure capturing the values from its surrounding environment. Two feasible fix methods:

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_099/  

