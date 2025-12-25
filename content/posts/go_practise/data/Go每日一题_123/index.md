---
date: '2024-12-06T23:55:50+08:00'
draft: false
title: 'Go每日一题_123'
---
以下代码打印出来什么内容，说出为什么。

```go
package main

import (
    "fmt"
)

type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func live() People {
    var stu *Student
    return stu
}

func main() {
    if live() == nil {
        fmt.Println("AAAAAAA")
    } else {
        fmt.Println("BBBBBBB")
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答：BBBBBBB
简单来说,接口变量有2个值,一个是类型,另一个是值。
if 接口 时,值和类型都为零值时,接口live() == nil 判断才为T

## 接口interface内部结构

interface共有2种表现形式

```go
// 1 空接口
var MyInterface interface{}
// 2 非空接口
type MyInterface interface {
    function()
}
```

对应的2种底层结构

- 空接口

```go
type eface struct {      // 空接口
    _type *_type         // 类型信息
    data  unsafe.Pointer // 指向数据的指针(go 语言中特殊的指针类型 unsafe.Pointer 类似于 c 语言中的void*)
}
type _type struct {
    size       uintptr // 类型大小
    ptrdata    uintptr // 前缀持有所有指针的内存大小
    hash       uint32  // 数据 hash 值
    tflag      tflag
    align      uint8   // 对齐
    fieldalign uint8   // 嵌入结构体时的对齐
    kind       uint8   // kind 有些枚举值 kind 等于 0 是无效的
    // function for comparing objects of this type
    // (ptr to object A, ptr to object B) -> ==?
    equal     func(unsafe.Pointer, unsafe.Pointer) bool
    gcdata    *byte
    str       nameOff
    ptrToThis typeOff
}
```

_type 属性：是 Go 语言中所有类型的公共描述，Go 语言几乎所有的数据结构都可以抽象成_type，是所有类型的公共描述，_type 负责决定 data 应该如何解释和操作
data 属性： 表示指向具体的实例数据的指针，它是一个unsafe.Pointer类型，相当于一个 C 的万能指针void*。

- 非空接口

```go
/// 非空接口
type iface struct {
  tab  *itab
  data unsafe.Pointer
}
type itab struct {
  inter  *interfacetype   // 接口自身的元信息
  _type  *_type           // 具体类型的元信息
  hash   int32            // _type 里也有一个同样的 hash，此处多放一个是为了方便运行接口断言
  _      [4]byte
  fun    [1]uintptr       // 函数指针，指向具体类型所实现的方法
}
```

// itab 里面包含了 interface 的一些关键信息，比如 method 的具体实现。

1. interface type包含了一些关于 interface 本身的信息，比如package path，包含的method。这里的interfacetype 是定义 interface 的一种抽象表示。
2. _type表示具体化的类型，与 eface 的_type 类型相同。
3. ash字段其实是对_type.hash的拷贝，它会在 interface 的实例化时，用于快速判断目标类型和接口中的类型是否一致。另，Go 的 interface 的 Duck-typing 机制也是依赖这个字段来实现。
4. fun字段其实是一个动态大小的数组，虽然声明时是固定大小为 1，但在使用时会直接通过 fun 指针获取其中的数据，并且不会检查数组的边界，所以该数组中保存的元素数量是不确定的。

## 回到本题

People 拥有一个 Show 方法，属于非空接口

```go
type iface struct {
  tab  *itab
  data unsafe.Pointer
}
func live() People {
    var stu *Student
    return stu
}

live() == nil
```

这里接口的itab已经指向Student。因此接口不为nil

{{< /togglecontent >}}
