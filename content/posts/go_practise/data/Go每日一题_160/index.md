---
date: '2025-01-13T12:22:18+08:00'
draft: false
title: 'Go每日一题_160'
---
它们是否能编译通过？为什么？

```go
// 32 位机器
1）var x int32 = 32.
2）var y int = x
3）var z rune = x
```

{{< togglecontent label="🔑 答案解析：" >}}

1 [可以](https://go.dev/play/p/9eGpGYkcqqp)
2 [不可以](https://go.dev/play/p/L5LsYs4NvDO)
3 [可以](https://go.dev/play/p/xgIjiu6PQ1l)

## 解析

# Go 语言类型系统与代码解析

## 1. 无类型字面量

在 Go 语言中，字面量（如 `32.0`）是无类型的（untyped）。无类型字面量可以根据上下文自动推断为目标类型。

### 示例

```go
var a int64 = 32.0    // 32.0 是无类型浮点数字面量，赋值给 int64 类型
var b int = 32.0      // 32.0 是无类型浮点数字面量，赋值给 int 类型
var c float32 = 32.0  // 32.0 是无类型浮点数字面量，赋值给 float32 类型
var d complex64 = 32.0 // 32.0 是无类型浮点数字面量，赋值给 complex64 类型
var e byte = 32.0     // 32.0 是无类型浮点数字面量，赋值给 byte 类型
var f rune = 32.0     // 32.0 是无类型浮点数字面量，赋值给 rune 类型
```

## 2. Go 语言的类型系统

Go 语言的类型系统非常严格，没有隐式类型转换。即使两种类型的底层表示相同，它们仍然是不同的类型，不能直接赋值

```go
var x int32 = 32
var y int = x // 编译错误：cannot use x (type int32) as type int in assignment
```

修正方法
必须显式进行类型转换：

```go
var y int = int(x) // 显式类型转换
```

## 3. 类型别名

Go 1.9 引入了类型别名的概念。类型别名和原类型是完全相同的类型。

```go
type intalias = int // intalias 是 int 的别名
```

Go 语言中的 rune 和 byte 是内置的类型别名：

```go
type rune = int32
type byte = uint8
```

本题中

```go
var x int32 = 32
var z rune = x // 正确，rune 是 int32 的别名
```

## 4. 题目代码解析

```go
1) var x int32 = 32.0 // 可以编译通过，因为无类型字面量 32.0 可以赋值给 int32 类型。
2) var y int = x // 编译失败，因为 int 和 int32 是不同的类型，Go 不会隐式转换。
3) var z rune = x // 可以编译通过，因为 rune 是 int32 的类型别名，x 的类型是 int32，可以直接赋值给 z。
```

## 5.修正后的代码

```go
var x int32 = 32.0       // 正确，无类型字面量赋值给 int32
var y int = int(x)       // 正确，显式类型转换
var z rune = x           // 正确，rune 是 int32 的别名
```

{{< /togglecontent >}}
