# Go Daily Question 079


<!--more-->
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

Reference Answer and Analysis: BD.

When a function parameter is `interface{}`, it can accept any type of argument, including user-defined types. Even when accepting a pointer type, `interface{}` should be used, not `*interface{}`.

> Never use a pointer to an interface type, because it is already a pointer.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_079/  

