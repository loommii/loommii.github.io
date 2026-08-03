# Go Daily Question 111


What is the output of the following code?

```go
package main

import (
    "fmt"
)

func increaseA() int {
    var i int
    defer func() {
        i++
    }()
    return i
}

func increaseB() (r int) {
    defer func() {
        r++
    }()
    return r
}

func main() {
    fmt.Println(increaseA())
    fmt.Println(increaseB())
}
```

A. 1 1
B. 0 1
C. 1 0
D. 0 0
{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: B.

Key takeaways: `defer`, return values. Note that `increaseA()` has an anonymous return parameter, while `increaseB()` has a named one. Regarding `defer` and return values, I will write a detailed article later, which you can refer to then.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_111/  

