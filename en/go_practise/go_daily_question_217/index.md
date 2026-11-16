# Go Daily Question 217


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

- A. 23 13
- B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B [Run online](https://go.dev/play/p/yz3LsE6kw-U)

Interface `A` does not have a `ShowB` method.
Interface `B` does not have a `ShowA` method.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_217/  

