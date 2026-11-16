# Go Daily Question 141


What is the output of the following code?

```go
func main() {
    s := make(map[string]int)
    delete(s, "h")
    fmt.Println(s["h"])
}
```

- A. runtime panic
- B. 0
- C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B
[Run online](https://go.dev/play/p/uvHvPF8EdU-)
Deleting a non-existent key does not cause a panic.

#### Extended Question

In this problem, `s` is already initialized. Would the behavior be the same if it were uninitialized?

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_141/  

