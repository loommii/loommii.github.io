# Go Daily Question 094


What is the output of the following code?

```go
type Math struct {
    x, y int
}

var m = map[string]Math{
    "foo": Math{2, 3},
}

func main() {
    m["foo"].x = 4
    fmt.Println(m["foo"].x)
}
```

A. 4
B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

Reference answer and explanation: B, compilation error "cannot assign to struct field m["foo"].x in map". The reason for the error is that for an assignment operation like `X = Y`, the address of `X` must be known to assign the value of `Y` to `X`. However, in Go, the value of a map itself is not addressable.

There are two solutions:

a. Use a temporary variable.

{{< /details >}}

```

---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_094/  

