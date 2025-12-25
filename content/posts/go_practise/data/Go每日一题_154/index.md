---
date: '2025-01-07T11:47:02+08:00'
draft: false
title: 'Go每日一题_154'
---
下面这段代码输出什么？

```go
package main

import (
    "fmt"
)

func main() {
    i := 65
    fmt.Println(string(i))
}

```

- A. A
- B. 65
- C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

A [在线运行](https://go.dev/play/p/lYfJ6qOVMJV)

string(i),在 Go 语言中，string(int) 会将整数解释为 Unicode 码点，并返回对应的字符。  
65 是字符 'A' 的 ASCII 码（也是 Unicode 码点），因此 string(65) 的结果是字符串 "A"。

{{< /togglecontent >}}
