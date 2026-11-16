# Go Daily Question 20250523


What is the output of the following code:

```go
package main

func main() {
  var x *struct {
    s [][32]byte
  }
  
  println(len(x.s[99]))
}
```

A: Runtime panic; B: 32; C: Compile error; D: 0
{{< details summary="🔑 Answer Analysis:" >}}

Answer: B

- The return result is always an `int`;
- The return result can sometimes be a constant;
- Sometimes function parameters are not evaluated, meaning the return value is determined at compile time;

Here, `len(x.s[99])`
Since the slice type of `s` is `[][32]byte`, `len(x.s[99]) = 32`.

It's important to understand here that `len` and `cap` do not panic; they are functions performed by the compiler.
The expression `x.s[99]` does not involve channel reception or function calls, so the return value is determined at compile time.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250523/  

