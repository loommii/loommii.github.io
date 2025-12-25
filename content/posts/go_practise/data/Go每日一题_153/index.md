---
date: '2025-01-06T12:10:52+08:00'
draft: false
title: 'Go每日一题_153'
---
下面代码填空cc处可以填入哪个选项？ 且描述一下填入后运行的结果

```go
package main

import "fmt"

func main() {
       var s1 []int
       var s2 = []int{}
       _, _ = s1, s2
       if 填空 == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }
}
```

- A. s1
- B. s2
- C. s1、s2 都可以
- D. 以上都不可以

{{< togglecontent label="🔑 答案解析：" >}}

C [在线运行](https://go.dev/play/p/9yTgpE0eMFE)

```go
package main

import "fmt"

func main() {
       var s1 []int
       var s2 = []int{}
       _, _ = s1, s2
       if s1 == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }

       if s2 == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }
}
//yes nil
//no nil
```

## 切片（Slice）  `nil` 与空切片

在 [Go 文档 - Slice types](https://golang.google.cn/ref/spec#Slice_types) 中有这样一段描述：

> **The value of an uninitialized slice is nil.**  
> 如果一个切片没有被初始化，它的值就是 `nil`。

根据这段描述，我们可以得出以下结论：

## 1. 填入 `s1` 的情况

- `s1` 是通过 `var s1 []int` 声明的，这是一个未初始化的切片，其值为 `nil`。
- 因此，程序会进入 `"yes nil"` 分支。

## 2. 填入 `s2` 的情况

- `s2` 是通过 `var s2 = []int{}` 声明的，这是一个已初始化的空切片。
- 虽然它的长度为 0，但它并不是 `nil`，而是指向了一个底层数组（即使该数组的空间为 0）。
- 因此，程序会进入 `"no nil"` 分支。

---

## 代码验证

以下[代码](https://go.dev/play/p/7RnFOI6Eade)验证了 `s1` 和 `s2` 的底层数据指针：

```go
package main

import (
       "fmt"
       "unsafe"
)

func main() {
       var s1 []int
       var s2 = []int{}

       fmt.Println("s1 底层 Data 值为", unsafe.SliceData(s1)) // <nil>
       fmt.Println("s2 底层 Data 值为", unsafe.SliceData(s2)) // 0x572380（具体地址可能不同）
}
```

### 补充

切片之间不能直接使用 == 或 != 进行比较

{{< /togglecontent >}}
