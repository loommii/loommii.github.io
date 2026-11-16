# Go Daily Question 171



What is the output of the following code?

```go
package main

import (
    "fmt"
)

func main() {
    var ans float64 = 15 + 25 + 5.2
    fmt.Println(ans)
}
```

- A: Cannot compile;
- B: 45;
- C: 45.2;
- D: 45.0

{{< details summary="🔑 Answer Analysis:" >}}

C
[Run online](https://go.dev/play/p/VCR1yAY32nG)

## Analysis

### 1. Constant Expressions

- A **constant expression** is an expression that contains only constant operands and is evaluated at compile time.
- Constants can be:
  - **Untyped constants**: e.g., `1`, `2`, `5.2`.
  - **Typed constants**: e.g., `const b int8 = 3`.
  - **Literal constants**: e.g., `1`, `2`, `5.2`.
  - **Named constants**: e.g., `const a = 1 + 2`.

### 2. Default Types of Untyped Constants

- Although untyped constants do not have an explicit type, they have a default type:
  - Integer literals (e.g., `15`, `25`) have a default type of `int`.
  - Floating-point literals (e.g., `5.2`) have a default type of `float64`.
  - String literals have a default type of `string`.
  - Boolean literals have a default type of `bool`.
  - Complex literals have a default type of `complex128`.

### 3. Type Inference

- Go language supports type inference. If the context does not specify an explicit type, the compiler will treat untyped constants as their default type.
- In a constant expression, if the operands include untyped constants of different types, the result's type will be inferred according to the following precedence:
  - Integer < rune < float < complex.

### 4. Constant Expression in the Problem

```go
var ans float64 = 15 + 25 + 5.2
```

- `15` and `25` are untyped integer constants, with a default type of `int`.
- `5.2` is an untyped floating-point constant, with a default type of `float64`.
- In the constant expression, since `5.2` is a floating-point constant, the entire expression's result will be inferred as a floating-point type (`float64`).

### Operation Process

- The result of `15 + 25` is `40`, which is still an untyped integer constant.
- The result of `40 + 5.2` is `45.2`. Since `5.2` is a floating-point constant, the entire expression's result is inferred as `float64`.

### Assignment and Output

- The final result `45.2` is assigned to the variable `ans`, whose type is `float64`.
- `fmt.Println(ans)` outputs `45.2`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_171/  

