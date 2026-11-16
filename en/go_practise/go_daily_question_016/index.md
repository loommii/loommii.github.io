# Go Daily Question 016

The author of Go101 published an interesting problem that primarily tests subtle details, a characteristic for which the book Go101 is well-known. Let's look at this problem: what is the output of the following program? (Single choice)

```go
package main

const s = "Go101.org"

// len(s) == 9
// 1 << 9 == 512
// 512 / 128 == 4

var a byte = 1 << len(s) / 128
var b byte = 1 << len(s[:]) / 128

func main() {
    println(a, b)
}
```

- A、0 0
- B、0 4
- C：4 0
- D：4 4

{{< details summary="🔑 Answer Analysis:" >}}

There are 2 key points here:

1. len(s)
    - If `s` is a string constant or a simple array expression, `len` returns an `int` constant.
    - If `s` is not the above (e.g., involving function calls, channels), `len` returns an `int` variable.

2. Regarding bit shift operations
   - If the left operand of a constant shift expression is an untyped constant, its result is an integer constant; otherwise, it is a constant of the same type as the left operand (must be an integer type).
   - If the left operand of a non-constant shift expression is an untyped constant, it is implicitly converted to the type that would result if the shift expression were replaced solely by its left operand.

#### Back to the problem

```go
const s = "Go101.org" // Declares a string constant s
len(s)  = 9 // len(string constant s) len returns an int constant
len(s[:])  = 9 // len(slice of string constant s) len returns an int variable

1 << int constant   // Constant shift expression
1 << int variable    // Non-constant shift expression


The result of a constant shift expression is an integer constant.
The result of a non-constant shift expression depends on the type of the left operand.
If the left operand has a type, the result is of the original type.
If the left operand has no type, the type of the left operand will be implicitly converted to the type of the variable to be assigned.
In this problem, the type is byte.
Here,
byte 1 << int 9 results in byte 512, which overflows, so it becomes 0.
0 / 9 = 0, therefore the output `b = 0`.
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_016/  

