---
date: '2024-12-06T19:49:56+08:00'
draft: false
title: 'Go每日一题_022'
---
下面这段代码能否通过编译，如果可以，输出什么？

```go
package main

var(
    size := 1024
    max_size = size*2
)

func main() {
    fmt.Println(size,max_size)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答：不能

```go
var(
    size := 1024
)
不符合规范
问题1：var 声明变量不能使用 :=
问题2:  := 只能在函数内使用，本题在声明全局变量中使用
```

参考解析：这道题的主要知识点是变量声明的简短模式，形如：x := 100.

#### 但这种声明方式有限制

- 必须使用显示初始化；
- 不能提供数据类型，编译器会自动推导；
- 只能在函数内部使用简短模式；
{{< /togglecontent >}}
