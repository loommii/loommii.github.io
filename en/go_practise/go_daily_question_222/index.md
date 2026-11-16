# Go Daily Question 222


Go101 author published a twitter. Will the following code run normally, and what is the result?
What is the output of the following code?

```go
package main

func main() {
    v := new(int)
    *v = 2
    println(5/+-*v)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: B.

Go has the following unary operators:

```go
unary_op = "+" | "-" | "!" | "^" | "*" | "&" | "<-" .
```

Therefore, `5/+-*v` will be calculated first.
Also, according to the specification:
> For integer operands, the unary operators +, -, and ^ are defined as follows: (omitting the explanation for ^)
+x is 0 + x
-x takes its negative value, which is 0 - x

So, after conversion, it becomes `5 / [0 + (0 - *v)]` which simplifies to `5 / -2`.
Due to implicit type conversion, -2.5 becomes -2.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_222/  

