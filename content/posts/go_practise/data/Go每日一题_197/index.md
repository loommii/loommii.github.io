---
date: '2025-02-26T01:01:24+08:00'
draft: false
title: 'Go每日一题_197'
---

以下代码是否能编译通过？

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)
    m["qcrao"] = 1
    fmt.Println(&m["qcrao"])
}
```

{{< togglecontent label="🔑 答案解析：" >}}

不能.

```go
./prog.go:8:15: invalid operation: cannot take address of m["qcrao"] (map index expression of type int)
```

[在线运行](https://go.dev/play/p/4W5-rMuIiYI)
map 的元素不能直接取地址。  
map 一旦发生扩容，key 和 value 的位置就会改变，之前保存的地址也就失效了。  

{{< /togglecontent >}}
