---
date: '2025-02-07T00:45:26+08:00'
draft: false
title: 'Go每日一题_178'
---
下面这段代码输出什么？

```go
package main

import "fmt"

func change(s ...int) {
    s = append(s, 3)
}

func main() {
    slice := make([]int, 5, 5)
    slice[0] = 1
    slice[1] = 2
    change(slice...)
    fmt.Println(slice)
    change(slice[0:2]...)
    fmt.Println(slice)
}

```

{{< togglecontent label="🔑 答案解析：" >}}

```go
[1 2 0 0 0]
[1 2 3 0 0]
```

[Go在线运行](https://go.dev/play/p/sJ68ZpNd2Tj)

{{< /togglecontent >}}
