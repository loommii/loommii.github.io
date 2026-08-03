# Go Daily Question 071


What is the output of the following code?

```go
func increaseA() int {
    var i int
    defer func() {
        i++
    }()
    return i
}

func increaseB() (r int) {
    defer func() {
        r++
    }()
    return r
}

func main() {
    fmt.Println(increaseA())
    fmt.Println(increaseB())
}
```

A. 1 1
B. 0 1
C. 1 0
D. 0 0
{{< details summary="🔑 Answer Analysis:" >}}
Reference Answer and Analysis: B.

Key takeaways: `defer`, return values. Note that `increaseA()` has an anonymous return parameter, while `increaseB()` has a named one.
For `increaseA`, `return r` already returns the value of `r`, and subsequent changes to `r` do not affect the returned value.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_071/  

