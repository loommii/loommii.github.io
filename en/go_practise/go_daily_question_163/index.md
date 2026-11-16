# Go Daily Question 163


What is the output of the following code?

```go
package main

import "fmt"

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
    var a A = Work{3}
    s := a.(Work)
    fmt.Println(s.ShowA())
    fmt.Println(s.ShowB())
}
```

- A. 13 23
- B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

A
[Run online](https://go.dev/play/p/dy8gUTSGZz8)

### **Code Analysis**

1.  **Interface and Struct Definition**:
    - Two interfaces `A` and `B` are defined, containing methods `ShowA()` and `ShowB()` respectively.
    - A struct `Work` is defined, and `ShowA()` and `ShowB()` methods are implemented for it.

2.  **Interface Assignment**:
    - In the `main` function, `var a A = Work{3}` assigns `Work{3}` to the interface variable `a`. At this point, the dynamic type of `a` is `Work`, and the dynamic value is `Work{3}`.

3.  **Type Assertion**:
    - `s := a.(Work)` performs a type assertion, converting the interface variable `a` to its concrete type `Work`. Since the dynamic type of `a` is indeed `Work`, the type assertion succeeds, and `s` is `Work{3}`.

4.  **Method Calls**:
    - `s.ShowA()` calls the `ShowA()` method, returning `w.i + 10`, which is `3 + 10 = 13`.
    - `s.ShowB()` calls the `ShowB()` method, returning `w.i + 20`, which is `3 + 20 = 23`.

5.  **Output Result**:
    - `fmt.Println(s.ShowA())` outputs `13`.
    - `fmt.Println(s.ShowB())` outputs `23`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_163/  

