# Go Daily Question 067


What is the output of the following code?

```go
type A interface {
    ShowA() int
}

type B interface {
    ShowB() int
}

type Work struct {
    i int
}

func (w Work) ShowA() int {
    return w.i + 10
}

func (w Work) ShowB() int {
    return w.i + 20
}

func main() {
    c := Work{3}
    var a A = c
    var b B = c
    fmt.Println(a.ShowB())
    fmt.Println(b.ShowA())
}

```

A. 23 13
B. compilation error
{{< details summary="🔑 Answer Analysis:" >}}

B
Key takeaway: Static type of interfaces. `a` and `b` have the same dynamic type and dynamic value, which are `Work` struct and `{3}` respectively. The static type of `a` is `A`, and the static type of `b` is `B`. Interface `A` does not include method `ShowB()`, and interface `B` does not include method `ShowA()`, resulting in a compilation error.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_067/  

