# Go Daily Question 074


What is the output of the following code?

```go
package main

import "fmt"

func app() func(string) string {
    t := "Hi"
    c := func(b string) string {
        t = t + " " + b
        return t
    }
    return c
}

func main() {
    a := app()
    b := app()
    a("go")
    fmt.Println(b("All"))
    fmt.Println(a("All"))
}
```

A: Hi All; B: Hi go All; C: Hi; D: go Al
{{< details summary="🔑 Answer Analysis:" >}}

Closure
    `fmt.Println(b("All"))` outputs A (Hi All)
    `fmt.Println(a("All"))` outputs B (Hi go All)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_074/  

