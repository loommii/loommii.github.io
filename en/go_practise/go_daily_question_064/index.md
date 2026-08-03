# Go Daily Question 064


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

Reference Answer and Analysis: 13 23.

Key takeaway: Interfaces. A type implementing multiple interfaces. The `Work` struct implements interfaces A and B separately, so interface variables `a` and `b` call their respective methods `ShowA()` and `ShowB()`, outputting 13 and 23.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_064/  

