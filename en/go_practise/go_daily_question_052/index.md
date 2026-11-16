# Go Daily Question 052


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
    t.ShowB()
}

```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: `teacher showB`
`t.ShowB()` will use its own existing `ShowB()`. If you want to use the parent struct's (`People`) `ShowB()`, you need to change it to `t.People.ShowB()`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_052/  

