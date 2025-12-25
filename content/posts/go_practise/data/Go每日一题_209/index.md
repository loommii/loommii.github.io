---
date: '2025-03-10T11:03:42+08:00'
draft: false
title: 'Go每日一题_209'
---
以下代码输出什么？

```go
package main

import (
    "fmt"
)

func main() {
    var a, b float64 = 1.0, 4.0
    fmt.Println(a | b)
}
```

A：5
B：+Inf
C：panic
D：不能编译

{{< togglecontent label="🔑 答案解析：" >}}

D 不能编译

[在线运行](https://go.dev/play/p/lLMbGE_ajrg)

`|` 操作是按位或操作符，它的操作数只能是整数，而上面这道题的操作数是 float64，因此编译不通过。  
编译报错内容
>> ./prog.go:9:14: invalid operation: operator | not defined on a (variable of type float64)
>
>> ./prog.go:9:14: 无效操作：运算符 | 不能在类型为 float64 的变量 a 上使用

这是 [Go 规范](https://golang.google.cn/ref/spec#Arithmetic_operators)的内容

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

{{< /togglecontent >}}
