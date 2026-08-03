# Go Daily Question 144


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

```text
teacher showB
```

[Run online](https://go.dev/play/p/dnitHoT5yHi)

### Key Takeaway: Struct Embedding

The `Teacher` struct embeds the `People` struct.
In an embedded struct, `People` is called the inner type, and `Teacher` is called the outer type; through embedding, the inner type's attributes and methods become available to the outer type, as if they were its own. Additionally, the outer type can define its own attributes and methods, and even define methods with the same name as those in the inner type, in which case the inner type's methods will be "shadowed". `ShowB()` in this example is such a method with the same name.

If you want to call the `ShowB()` method of `People`, you need to use:

```go
t.People.ShowB()
```

[Run online](https://go.dev/play/p/oi34XpDskH2)

`t.People.ShowA()` is equivalent to `t.ShowA()`.
Because `Teacher` does not have its own `ShowA()` method, it can be omitted. This is Go's syntactic sugar.

```go
// Both are equivalent
t.People.ShowA()
t.ShowA()
```

[Run online](https://go.dev/play/p/RZ0M-MjpMcM)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_144/  

