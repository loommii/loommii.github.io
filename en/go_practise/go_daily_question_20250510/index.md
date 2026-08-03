# Go Daily Question 20250510


Will the following code run normally, and what is the result?

```go
package main

func main() {
    v := new(int)
    *v = 2
    println(5/+-*v)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

It runs normally and the result is -2.

[Run online](https://go.dev/play/p/5A8BdXFzaOf)

## Expression Parsing

`5/+-*v`
Go language [operator precedence rules](https://golang.google.cn/ref/spec#Operators)
> `unary_op = "+" | "-" | "!" | "^" | "*" | "&" | "<-" .`

The unary operators in the problem are `+`, `-`, and `*`.

`+`, `-`, and `*` are also addition, subtraction, and multiplication in arithmetic operators.

Expression: `5/+-*v`. The `/` after `5` is clearly division.
Since there is no operand before `+`, it is a unary operator; similarly, `-` and `*` are also unary operators. Unary operators have the highest precedence, so this expression first calculates the value of `+-*v`.

The specification states:

> For integer operands, the unary operators `+`, `-`, and `^` are defined as follows: (omitting the explanation for `^`)
> `+x` is `0 + x`
> ` -x` takes its negative value, which is `0 - x`

Therefore, `+-*v` can be converted to `0 + (0 - (*v))`.

Substituting `*v = 2` gives `0 + (0 - (2))`.

Thus, the result becomes calculating `5 / -2`.

The answer is -2.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250510/  

