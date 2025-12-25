---
date: '2024-12-06T19:49:56+08:00'
draft: false
title: 'Go每日一题_024'
---
下面这段代码能否通过编译？如果通过，输出什么？

```go
package main

import "fmt"

type MyInt1 int
type MyInt2 = int

func main() {
    var i int =0
    var i1 MyInt1 = i 
    var i2 MyInt2 = i
    fmt.Println(i1,i2)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答: 不能
参考解析：这道题考的是类型别名与类型定义的区别。
类型别名`` type MyInt2 = int ``
类型定义`` type MyInt1 int ``
Go 赋值 = 左右的类型需要一致。
MyInt1 是基于int定义的新类型,因此不能直接赋值。如果需要赋值，需要类型转换``var i1 MyInt1 = MyInt1(i)``
{{< /togglecontent >}}
