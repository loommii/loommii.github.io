---
date: '2025-02-20T02:22:18+08:00'
draft: false
title: 'Go每日一题_191'
---

下面这段代码输出什么，说明原因。

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)

    for key, val := range slice {
        m[key] = &val
    }

    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

Go1.22 版本之前

```go
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

Go1.22 版本之后

```go
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

[Go在线运行](https://go.dev/play/p/9TPNWgfwp0J)

Go1.22 之前 for range 循环的时候会key, val的地址是不会变化的，所以输出都是3

{{< /togglecontent >}}
