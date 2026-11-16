# Go Daily Question 20250514


Which options A, B, C, D have syntax errors?

```go
type S struct {
}

func f(x interface{}) {
}

func g(x *interface{}) {
}

func main() {
       s := S{}
       p := &s
       f(s) //A
       g(s) //B
       f(p) //C
       g(p) //D
}
```

{{< details summary="🔑 Answer Analysis:" >}}

BD [Run online](https://go.dev/play/p/sXFam1hdBhS)

When a function parameter is `interface{}`, it can accept any type of argument, including user-defined types. Even when accepting a pointer type, `interface{}` should be used, not `*interface{}`.
> Never use a pointer to an interface type, because it is already a pointer.

When the parameter is `*interface{}`, it can only accept a pointer to an empty interface, not any type.

```go
func g(x *interface{}) {
}

func main() {
       s := S{}
       p := &s
       f(s) //A
       var r interface{} = p
       g(&r) //D
}
```

For example, `D` would not report an error this way, but it is not recommended to use it.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250514/  

