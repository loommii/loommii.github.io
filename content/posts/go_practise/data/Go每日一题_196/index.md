---
date: '2025-02-25T00:52:39+08:00'
draft: false
title: 'Go每日一题_196'
---

以下代码是否能编译通过？

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)
    fmt.Println(&m["qcrao"])
}
```

{{< togglecontent label="🔑 答案解析：" >}}

不能.

```go
./prog.go:8:15: invalid operation: cannot take address of m["qcrao"] (map index expression of type int)
```

[在线运行](https://go.dev/play/p/F-dYKNEFmvp)
map 的元素不能直接取地址。

{{< /togglecontent >}}
