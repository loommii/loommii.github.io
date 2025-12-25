---
date: '2025-01-01T13:08:46+08:00'
draft: false
title: 'Go每日一题_148'
---
下列选项正确的是？

```go
package main

import "fmt"

func main() {
    str := "hello"
    str[0] = 'x'
    fmt.Println(str)
}
```

- A. hello
- B. xello
- C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

C  
[在线运行](https://go.dev/play/p/WKuFSxIZZM8)

[Go官方文档-String_types](https://golang.google.cn/ref/spec#String_types)
> Strings are immutable: once created, it is impossible to change the contents of a string.  
> 字符串是不可变的：一旦创建，就无法改变字符串的内容。

题目中str是string,无法改变字符串的内容,因此str[0] = 'x'会报错。

## 扩展

### string的内部结构

string在Go中的内部结构是reflect.StringHeader位于[reflect/value.go](https://github.com/golang/go/blob/master/src/reflect/value.go#L2530C1-L2531C1)

```go
type StringHeader struct {
    Data uintptr
    Len  int
}
```

- Data 是一个 uintptr 类型，表示指向字符串数据（字节数组）的指针。
- Len 是一个 int 类型，表示字符串的长度。

而Data字符串字面量：其数据存储在内存的只读的data段（数据区）。

在Go语言中，字符串的内存管理具有一定的优化机制，相同字符串字面量共享底层数组。

```go
package main

import (
    "fmt"
    "unsafe"
)

func main() {
    str1 := "hello"
    str2 := "hello"
    sh1 := unsafe.StringData(str1)
    sh2 := unsafe.StringData(str2)
    fmt.Println("str1 Data:", sh1)
    fmt.Println("str2 Data:", sh2)
    fmt.Println("str1 == str2:", str1 == str2)
    fmt.Println("str1 same data as str2:", sh1 == sh2)

    str3 := "hello" + " world"
    str4 := "hello" + " world"
    sh3 := unsafe.StringData(str3)
    sh4 := unsafe.StringData(str4)

    fmt.Println("str3 Data:", sh3)
    fmt.Println("str4 Data:", sh4)
    fmt.Println("str3 == str4:", str3 == str4)
    fmt.Println("str3 same data as str4:", sh3 == sh4)
}
// str1 Data: 0x4af0e8
// str2 Data: 0x4af0e8
// str1 == str2: true
// str1 same data as str2: true
// str3 Data: 0x4afc26
// str4 Data: 0x4afc26
// str3 == str4: true
// str3 same data as str4: true
```

[在线运行](https://go.dev/play/p/FF90LU6QsJk)

上面这个例子就可以展示不同的String变量使用了相同的Data

因此假若允许改变字符串的内容，我们修改底层的Data数据可能会影响到其他字符串，为了避免这种情况。Go是不允许的会发生`Panic`

```go
package main

import (
    "fmt"
    "unsafe"
)

func main() {
    str1 := "hello"
    str2 := "hello"
    str1Slice := unsafe.Slice(unsafe.StringData(str1), len(str1))
    str1Slice[0] = 'x'
    fmt.Println(str2)
}
// unexpected fault address 0x4af0e8
// fatal error: fault
// [signal SIGSEGV: segmentation violation code=0x2 addr=0x4af0e8 pc=0x48f21e]
```

[在线运行](https://go.dev/play/p/nzSHK4l6kDl)

这与本题错误是不一样的，一个是编译不通过，一个是运行时发生panic。

{{< /togglecontent >}}
