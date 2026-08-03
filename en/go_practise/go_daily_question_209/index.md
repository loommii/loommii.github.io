# Go Daily Question 209


What is the output of the following code?

```go
package main

import "fmt"

func main() {
    var a, b float64 = 1.0, 4.0
    fmt.Println(a | b)
}
```

A: 5
B: +Inf
C: panic
D: Cannot compile

{{< details summary="🔑 Answer Analysis:" >}}

D Cannot compile

[Run online](https://go.dev/play/p/lLMbGE_ajrg)

The `|` operator is a bitwise OR operator, and its operands can only be integers. In the problem above, the operands are `float64`, so it will not compile.
Compilation error message:
>> `./prog.go:9:14: invalid operation: operator | not defined on a (variable of type float64)`
>
>> `./prog.go:9:14: 无效操作：运算符 | 不能在类型为 float64 的变量 a 上使用`

This is from the [Go Specification](https://golang.google.cn/ref/spec#Arithmetic_operators):

```go
+    sum                    integers, floats, complex values, strings
-    difference             integers, floats, complex values
*    product                integers, floats, complex values
/    quotient               integers, floats, complex values
%    remainder              integers

&    bitwise AND            integers
|    bitwise OR             integers
^    bitwise XOR            integers
&^   bit clear (AND NOT)    integers

<<   left shift             integer << integer >= 0
>>   right shift            integer >> integer >= 0
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_209/  

