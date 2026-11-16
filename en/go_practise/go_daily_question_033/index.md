# Go Daily Question 033



Today, here are two similar problems; note that more than half of people might get them wrong!

```go
package main

func main() {
    var a int8 = -1
    var b int8 = -128 / a

    println(b)
}
```

```go
package main

func main() {
    const a int8 = -1
    var b int8 = -128 / a

    println(b)
}
```

{{< details summary="🔑 Answer Analysis:" >}}
Problem 1:
Because `var b int8 = -128 / a` is not a constant expression, the untyped constant -128 is implicitly converted to `int8` type (i.e., the same type as `a`). Therefore, the result of `-128 / a` is of `int8` type, and its value is 128, which is outside the range of `int8`. Since the result is not a constant, overflow is allowed. The binary representation of 128 is 10000000, which is exactly the two's complement of -128. So, the result of the first problem is -128.
Problem 2:
-128 and -1 are both `const`s and are evaluated directly at compile time. The untyped -128 is implicitly converted to `int8`, and the result is 128, which is still a `const`. Constant conversion does not allow overflow, leading to a compilation error. The real difference lies in the value of the expression: Problem 1 is not a constant, while Problem 2 is. Constant type conversion does not allow overflow followed by truncation.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_033/  

