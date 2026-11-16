# Go Daily Question 073


What do the f1(), f2(), and f3() functions return respectively?

```go
func f1() (r int) {
    defer func() {
        r++
    }()
    return 0
}


func f2() (r int) {
    t := 5
    defer func() {
        t = t + 5
    }()
    return t
}


func f3() (r int) {
    defer func(r int) {
        r = r + 5
    }(r)
    return 1
}

```

{{< details summary="🔑 Answer Analysis:" >}}

f1: 1
f2: 5
f3: 1

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_073/  

