# Go Daily Question 203


Today, here are two similar problems; note that more than half of people might get them wrong!

Problem 1:

```go
package main

func main() {
    var a int8 = -1
    var b int8 = -128 / a

    println(b)
}
```

Problem 2:

```go
package main

func main() {
    const a int8 = -1
    var b int8 = -128 / a

    println(b)
}
```

Will the above two problems compile? If they compile, what will be the output?

{{< details summary="🔑 Answer Analysis:" >}}

Answer:
Problem 1 compiles and outputs -128.
Problem 2 does not compile.
The Go language specification states:
> For signed integer values, the operations +, -, *, /, and << can legally overflow, and the resulting values exist and are explicitly defined by signed integer representation, their operations, and operands.
Therefore, -128 / -1 = 128. The range of `int8` is -128 to 127, so 128 overflows. The binary representation of 128 is 10000000, which is exactly the two's complement of -128. So, the result of the first problem is -128.

Why does the second problem fail to compile?

For `var b int8 = -128 / a`, because `a` is an `int8` type constant, `-128 / a` is a constant expression. The compiler evaluates it, and the result must also be a constant.
Because `a` is of type `int8`, -128 will also be implicitly converted to `int8`. The result 128 exceeds the range of `int8`, but constants are not allowed to overflow, so it results in a compilation error.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_203/  

