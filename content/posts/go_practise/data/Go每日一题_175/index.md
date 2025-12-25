---
date: '2025-02-04T00:45:22+08:00'
draft: false
title: 'Go每日一题_175'
---
下面这段代码输出什么？

```go
package main

import "fmt"

const (
    a = iota
    b = iota
)
const (
    name = "name"
    c    = iota
    d    = iota
)

func main() {
    fmt.Println(a)
    fmt.Println(b)
    fmt.Println(c)
    fmt.Println(d)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```
0
1
1
2
```

[在线运行](https://go.dev/play/p/3owhzDo5QeG)

**代码解析：**

### 第一个 `const` 块

- `a = iota`: `iota` 在 `const` 块中从 `0` 开始计数，因此 `a = 0`
- `b = iota`: `iota` 自增到 `1`，因此 `b = 1`

### 第二个 `const` 块

- `name = "name"`: 未使用 `iota`，但 `iota` 初始值为 `0`，声明后自增到 `1`
- `c = iota`: 当前 `iota` 值为 `1`，因此 `c = 1`
- `d = iota`: `iota` 继续自增到 `2`，因此 `d = 2`

### 关键规则

- `iota` 在每个 `const` 块中从 `0` 开始计数
- 每行常量声明（无论是否使用 `iota`）都会使 `iota` 自增 `1`
- 不同 `const` 块的 `iota` 相互独立

{{< /togglecontent >}}
