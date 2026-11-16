# Go Daily Question 189


If the calling code for the `Add()` function is:

```go
func main() {
    var a Integer = 1
    var b Integer = 2
    var i interface{} = &a
    sum := i.(*Integer).Add(b)
    fmt.Println(sum)
}
```

Then the correct definition for the `Add` function is:

```go
A.
type Integer int
func (a Integer) Add(b Integer) Integer {
        return a + b
}

B.
type Integer int
func (a Integer) Add(b *Integer) Integer {
        return a + *b
}

C.
type Integer int
func (a *Integer) Add(b Integer) Integer {
        return *a + b
}

D.
type Integer int
func (a *Integer) Add(b *Integer) Integer {
        return *a + *b
}
```

{{< details summary="🔑 Answer Analysis:" >}}

A, C

From the code `i.(*Integer).Add(b)`, it can be concluded that answer C is definitely correct.
For code A, the receiver type is a value type `Integer`, but it can be called via a pointer (Go automatically dereferences `*Integer` to `Integer`).
Therefore, code A is also valid.

[Go Official Documentation - Method Values](https://go.dev/ref/spec#Method_values)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_189/  

