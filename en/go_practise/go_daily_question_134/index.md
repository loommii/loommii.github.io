# Go Daily Question 134


What is the output of the following code?

```go
func main() {  
    a := 5
    b := 8.1
    fmt.Println(a + b)
}
```

- A.13.1
- B.13
- C.compilation error

{{< details summary="🔑 Answer Analysis:" >}}

Answer: C. Run online: <https://go.dev/play/p/VDTgpXoukTb>

In Go, there is no implicit type conversion between variables. However, the compiler can perform implicit type conversion between variables and constants.

In the problem, `a` is an `int` variable and `b` is a `float64` variable.

Different types cannot use the `+` operator.

Implicit type conversion between constants:

```go
func main() {
    const a = 5
    const b = 8.1
    fmt.Println(a + b) // 13.1
}
```

Run online: <https://go.dev/play/p/4KXch9jes-y>

Type precedence: Integer (int) < Rune (rune) < Float (float) < Complex (Imag)

```go
func main() {
    a := 5
    const b = 8.1
    fmt.Println(a + b) // Error
}
```

Run online: <https://go.dev/play/p/sIINDSsakdz>
Variable `a` is `int`. Variable `b` cannot be inferred as `int`.

```go
func main() {
    const a = 5
    b := 8.1
    fmt.Println(a + b) // 13.1
}
```

Run online: <https://go.dev/play/p/JNhNXc1OErN>

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_134/  

