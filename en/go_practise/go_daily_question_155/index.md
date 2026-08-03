# Go Daily Question 155


What is the output of the following code?

```go
package main

import (
    "fmt"
)

type A interface {
    ShowA() int
}

type B interface {
    ShowB() int
}

type Work struct {
    i int
}

func (w Work) ShowA() int {
    return w.i + 10
}

func (w Work) ShowB() int {
    return w.i + 20
}

func main() {
    c := Work{3}
    var a A = c
    var b B = c
    fmt.Println(a.ShowA())
    fmt.Println(b.ShowB())
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
13
23
```

[Run online](https://go.dev/play/p/tzzCLmrk2Ns)

Key takeaway: Interfaces.

[Go Official Documentation - Interface Types](https://golang.google.cn/ref/spec#Interface_types)

### Code Analysis Process for this Problem

1.  **Struct and Interface Implementation**:
    - The `Work` struct implements the `ShowA()` method of interface `A`, returning `w.i + 10`.
    - The `Work` struct also implements the `ShowB()` method of interface `B`, returning `w.i + 20`.

2.  **Variable Assignment**:
    - `c := Work{3}`: Creates an instance `c` of type `Work`, with its `i` field having a value of `3`.
    - `var a A = c`: Assigns `c` to the variable `a` of interface type `A`. At this point, `a` can call the `ShowA()` method.
    - `var b B = c`: Assigns `c` to the variable `b` of interface type `B`. At this point, `b` can call the `ShowB()` method.

3.  **Method Calls**:
    - `a.ShowA()`: Calls the `ShowA()` method of `Work`, returning `3 + 10 = 13`.
    - `b.ShowB()`: Calls the `ShowB()` method of `Work`, returning `3 + 20 = 23`.

4.  **Output Result**:
    - `fmt.Println(a.ShowA())` outputs `13`.
    - `fmt.Println(b.ShowB())` outputs `23`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_155/  

