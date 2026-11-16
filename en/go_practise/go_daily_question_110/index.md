# Go Daily Question 110


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

AC
If it's `func (a Integer)`, the compiler will automatically add `func (a *Integer)` for you.
The reverse is not true.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_110/  

