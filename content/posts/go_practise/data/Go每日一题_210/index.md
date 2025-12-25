---
date: '2025-03-11T23:08:05+08:00'
draft: false
title: 'Go每日一题_210'
---
Go 1.15 中 var i interface{} = a 会有额外堆内存分配吗？
具体代码是：

```go
var a  int = 3
// 以下有额外内存分配吗？
var i interface{} = a
```

{{< togglecontent label="🔑 答案解析：" >}}

正确答案:不会

解析:

在 Go 中，接口被实现为一对指针（请参阅 Russ Cox 的 Go 数据结构：接口）：指向有关类型信息的指针和指向值的指针。可以简单的表示为：

```go
type iface struct {
    tab  *itab
    data unsafe.Pointer
}
```

其中 tab 是指向类型信息的指针；data 是指向值的指针。因此，一般来说接口意味着必须在堆中动态分配该值。

简单来说，接口等于类型加上值，因此会在堆中动态分配该值。
那什么这道题是不会呢？
因为在Go1.15版本[**Go 1.15 发行说明**](https://golang.google.cn/doc/go1.15)在 runtime 部分中提到了一个有趣的改进：

> Converting a small integer value into an interface value no longer causes allocation.

意思是说，将小整数转换为接口值不再需要进行内存分配。小整数是指 0 到 255 之间的数。

{{< /togglecontent >}}
