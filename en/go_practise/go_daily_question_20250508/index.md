# Go Daily Question 20250508



What do the f1(), f2(), and f3() functions return respectively?

```golang
package main

import (
    "fmt"
)

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

func main() {

    fmt.Println(f1())
    fmt.Println(f2())
    fmt.Println(f3())
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: 1 5 1.

Key takeaways: `defer`, return values.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250508/  

