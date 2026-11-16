# Go Daily Question 031


What does the following code print, and why?

```go
package main

import (
    "fmt"
)

type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func live() People {
    var stu *Student
    return stu
}

func main() {
    if live() == nil {
        fmt.Println("AAAAAAA")
    } else {
        fmt.Println("BBBBBBB")
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Output is BBBBBBB
Simply put, an interface variable has two values: one is its type, and the other is its value.
When checking an interface, the `live() == nil` condition is `True` only when both the value and the type are zero values.

```text
// Pseudocode
Pointer {
    Type Pointer
    Value Pointer
}
```

In the `live()` function:
`var stu *Student` type returns a `People` pointer.
Returned content:
Interface {
    Type Pointer -> `*Student`
    Value Pointer -> `nil`
}
When `if interface_type == nil`, it checks if both the type pointer and value pointer are `nil`. Only if both are `nil` is the result `True`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_031/  

