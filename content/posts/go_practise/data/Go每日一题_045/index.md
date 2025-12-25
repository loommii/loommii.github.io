---
date: '2024-12-06T20:44:23+08:00'
draft: false
title: 'Go每日一题_045'
---
以下代码能否通过编译？

```go
package main

import (
    "fmt"
)

type worker interface {
    work()
}

type person struct {
    name string
    worker
}

func main() {
    var w worker = person{}
    fmt.Println(w)
}
```

A: 能；B: 不能；C: 不知道

{{< togglecontent label="🔑 答案解析：" >}}

A

Go结构体中是可以嵌套接口类型的

嵌入接口有实际用途。
例：标准库中 sort 包中，有一个接口：Interface

```go
type Interface interface {
    // Len is the number of elements in the collection.
    Len() int
    // Less reports whether the element with
    // index i should sort before the element with index j.
    Less(i, j int) bool
    // Swap swaps the elements with indexes i and j.
    Swap(i, j int)
}
type reverse struct {
    // This embedded Interface permits Reverse to use the methods of
    // another Interface implementation.
    Interface
}
```

它就内嵌了一个 Interface，用于排序的反转。

而内嵌接口的关键在于如何给这个内嵌的接口赋值。sort 包有一个函数：Reverse

```go
func Reverse(data Interface) Interface {
    return &reverse{data}
}
```

其中实例化 reverse 时，直接通过传递的 Interface 实例赋值给 reverse 的内嵌接口，然后 reverse 类型可以有选择的重新实现内嵌的 Interface 的方法。比如 Less 方法：

```go
func (r reverse) Less(i, j int) bool {
    return r.Interface.Less(j, i)
}
```

回到上面的题目，如果我们通过实例化的 w 调用 work 方法会报错：

```go
var w worker = person{}
w.work()    // panic
```

和上面 reverse 类似，你需要给 person 中的 worker 实例化，也就是需要一个实现了 worker 接口的类型实例。比如：

```go
type student struct{
    name string
}

func (s student) work() {
    fmt.Println("I am ", s.name, ", I am learning")
}
```

然后这样实例化 person：

```go
var w worker = person{worker: student{"polarisxu"}}
```

{{< /togglecontent >}}
