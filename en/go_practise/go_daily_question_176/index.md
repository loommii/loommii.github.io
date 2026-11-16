# Go Daily Question 176


What is the output of the following code? Why?

```go
package main

import "fmt"

type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func main() {

    var s *Student
    if s == nil {
        fmt.Println("s is nil")
    } else {
        fmt.Println("s is not nil")
    }
    var p People = s
    if p == nil {
        fmt.Println("p is nil")
    } else {
        fmt.Println("p is not nil")
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
s is nil
p is not nil
```

> Remember, an interface type value is `nil` if and only if both its dynamic value and dynamic type are `nil`.

**Code Analysis:**

### 1. Judgment of variable `s`

- `var s *Student` declares a pointer variable `s` of type `*Student`, with a default value of `nil`.
- Directly judging `s == nil` results in `true`, outputting `s is nil`.

### 2. Judgment of variable `p`

- `var p People = s` assigns `s` (a pointer with a `nil` value) to the variable `p` of interface type `People`.
- **Underlying structure of Go interfaces**: An interface variable `p` contains two fields:
  - `Dynamic Type` (`*Student`): Stores the concrete type assigned to the interface.
  - `Dynamic Value` (`nil`): Stores the value of the concrete type.
- **Interface nil check rule**: An interface variable is equal to `nil` only when both its `dynamic type` and `dynamic value` are simultaneously `nil`.
  - In this example, the `dynamic type` of `p` is `*Student` (not `nil`), and the `dynamic value` is `nil`. Therefore, `p == nil` is `false`, outputting `p is not nil`.

### Key Conclusion

- **Pointer nil check**: The default value of `var s *T` is `nil`.
- **Interface nil check**:
  - If `nil` is directly assigned to an interface (e.g., `var p People = nil`), then both the `dynamic type` and `dynamic value` of the interface are `nil`. In this case, `p == nil` is `true`.
  - If a `nil` pointer of a concrete type is assigned to an interface (e.g., `var p People = s`), then the `dynamic type` of the interface will be recorded as the concrete type (not `nil`), even if the value is `nil`, the interface variable will not be equal to `nil`.

**Summary:**

The value we assigned to variable `p` was `nil`, yet `p` is not `nil`. Remember, an interface type value is `nil` if and only if both its dynamic value and dynamic type are `nil`. In the code above, after assigning to variable `p`, the dynamic value of `p` is `nil`, but the dynamic type is `*Student`, which is a `nil` pointer. Therefore, `p == nil` is `false`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_176/  

