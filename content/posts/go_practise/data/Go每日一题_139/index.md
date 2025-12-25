---
date: '2024-12-23T17:01:49+08:00'
draft: false
title: 'Go每日一题_139'
---
以下哪种类型可以使用 cap() 函数？

- A. array
- B. slice
- C. map
- D. channel

{{< togglecontent label="🔑 答案解析：" >}}

ABD
[官方文档](https://pkg.go.dev/builtin#cap)

```go
func cap(v Type) int
// cap 内建函数根据 v 的类型返回 v 的容量：
```

> - 数组 array：v 中元素的数量（与 len(v) 相同）。
> - 数组指针 *array：*v 中元素的数量（与 len(v) 相同）。
> - 切片 slice：切片重新切割时可以达到的最大长度；
> - 通道 channel：通道的缓冲区容量，以元素为单位；
> - 如果 v 为 nil，则 cap(v) 为零。

{{< /togglecontent >}}
