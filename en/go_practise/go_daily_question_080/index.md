# Go Daily Question 080


What code should be filled in at A and B below to ensure the result is printed successfully?

```go
type S struct {
    m string
}

func f() *S {
    return __  //A
}

func main() {
    p := __    //B
    fmt.Println(p.m) //print "foo"
}
```

{{< details summary="🔑 Answer Analysis:" >}}

A. &S{"foo"}
B. *f() or f()

The `f()` function returns a pointer type, so `&` can be used to get the pointer to the struct. For B, if `*f()` is filled in, `p` is of type `S`; if `f()` is filled in, `p` is of type `*S`. However, in both cases, `p.m` can be used to access the struct member.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_080/  

