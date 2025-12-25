---
date: '2024-12-25T00:09:11+08:00'
draft: false
title: 'Go每日一题_141'
---
下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
    s := make(map[string]int)
    delete(s, "h")
    fmt.Println(s["h"])
}
```

- A. runtime panic
- B. 0
- C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

B
[在线运行](https://go.dev/play/p/uvHvPF8EdU-)
delete不存在的Key 并不会panic

#### 扩展问题

本题中s是已经初始化的，如果未初始化结构还是一样的吗？

{{< /togglecontent >}}
