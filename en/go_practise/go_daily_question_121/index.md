# Go Daily Question 121


What will the following code output?

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

{{< details summary="🔑 Answer Analysis:" >}}
0
1
The difference between the two functions above is that `increaseA()` has an anonymous return parameter, while `increaseB()` has a named one.
For A, executing `return i` assigns the value of `i` to the return parameter, and the subsequent `i++` does not affect it.
For B, executing `return r` assigns `r` to `r`. The subsequent `r++` affects it because it's the same `r`.

```go
func increaseB() (r int) {
    defer func() {
        r++
    }()
    return 4
}
// Returns 5
```

The code above proves that `return 4` is assigned to `r`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_121/  

