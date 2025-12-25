---
date: '2025-01-04T17:03:14+08:00'
draft: false
title: 'Go每日一题_151'
---
以下代码输出什么？

```go
package main

import (
    "fmt"
)

func main() {
    a := []int{2: 1}
    fmt.Println(a)
}
```

- A：编译错误；
- B：[2 1]；
- C：[0 0 1]；
- D：[0 1]

{{< togglecontent label="🔑 答案解析：" >}}

C [在线运行](https://go.dev/play/p/VMev1IAKxKY)

Go中切片\数组初始化是可以携带索引的。

```go
// 1. 不带键的元素
slice1 := []int{1, 2, 3}

// 2. 带键的元素（键是索引）
slice2 := []string{0: "a", 1: "b", 2: "c"}
```

本题中含义为 索引下标2的元素为1 ，因此切片内容为[0 0 1]

{{< /togglecontent >}}
