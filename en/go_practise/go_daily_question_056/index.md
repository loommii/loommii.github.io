# Go Daily Question 056


What is the output of the following code?

```go
type People struct{}

func (p *People) ShowA() {
    fmt.Println("showA")
    p.ShowB()
}
func (p *People) ShowB() {
    fmt.Println("showB")
}

type Teacher struct {
    People
}

func (t *Teacher) ShowB() {
    fmt.Println("teacher showB")
}

func main() {
    t := Teacher{}
    t.ShowA()
}

```

{{< details summary="🔑 Answer Analysis:" >}}

Answer:
"showA"
"showB"

`t.ShowA()` will prioritize calling its own `ShowA()`. However, since it's not defined in the problem, it calls the parent struct's `ShowA()`. When it reaches `p.ShowB()`, note that `p` is `*People`, the parent struct, and it will call `p`'s own `ShowB()`.
Therefore, the output is:
"showA"
"showB"

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_056/  

