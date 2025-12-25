---
date: '2024-12-06T20:44:09+08:00'
draft: false
title: 'Go每日一题_033'
---

今天给两道类似的题目，注意，有半数以上的人可能会做错！

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

{{< togglecontent label="🔑 答案解析：" >}}
题一：
因为 var b int8 = -128 / a 不是常量表达式，因此 untyped 常量 -128 隐式转换为 int8 类型（即和 a 的类型一致），所以 -128 / a 的结果是 int8 类型，值是 128，超出了 int8 的范围。因为结果不是常量，允许溢出，128 的二进制表示是 10000000，正好是 -128 的补码。所以，第一题的结果是 -128。
题二：
-128 和 -1 都是 const，直接在编译时求值，untyped 的 -128 隐式转 int8，结果为 128，仍然是一个 const。const 转换时不允许溢出，编译错误。 其实差别就是表达式的值，题一不是常量题二是，常量类型转换不允许溢出后 truncate。
{{< /togglecontent >}}
