# Go Daily Question 223


Consider the following 3 lines of code:

```go
// 32-bit machine
1）var x int32 = 32.0
2）var y int = x
3）var z rune = x
```

Will they compile? Why?

If asked this question in an interview, you need to consider what the interviewer wants to test you on.
{{< details summary="🔑 Answer Analysis:" >}}

# Numeric Literals

In Go, literals are untyped. What does untyped mean? Untyped means they can be assigned to variables or constants of similar types. In the example above, `32.0` is an untyped floating-point literal, so it can be assigned to any numeric type variable (or constant). All of the following are legal:

```go
var a int64 = 32.0
var b int = 32.0
var c float32 = 32.0
var d complex64 = 32.0
var e byte = 32.0
var f rune = 32.0
```

Therefore, 1) in the problem above is correct.

# Different Types

In the current Go 1.16 version (in fact, only very early versions were different), the `int` type occupies 4 bytes on a 32-bit machine and 8 bytes on a 64-bit machine. So, on a 32-bit machine, the memory usage and layout of `int32` and `int` are exactly the same. But Go does not perform implicit type conversion; `int` and `int32` are different types, so 2) in the problem above will not compile.

# Aliases

What is `rune`? It is defined as follows:

```go
type rune = int32
```

Clearly, `rune` is an alias for `int32`, so 3) in the problem also compiles.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_223/  

