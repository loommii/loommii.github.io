# Go Daily Question 116


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
    fmt.Println(a.ShowA())
    fmt.Println(b.ShowB())
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: It compiles successfully and outputs 13 and 23.

```
    c := Work{3} // Here, variable c is declared and assigned the struct Work{3}
    var a A = c // Since A is an interface, we need to check if the Work struct implements the ShowA() int function required by interface A. In this problem, there is func (w Work) ShowA() int { so it can be assigned correctly.
    var b B = c // Same logic as A
    fmt.Println(a.ShowA())  // Interface A has ShowA, so it can be called successfully
    fmt.Println(b.ShowB()) // Same logic as A
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_116/  

