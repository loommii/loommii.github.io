---
date: '2025-05-11T00:27:21+08:00'
draft: false
title: 'Go每日一题_20250511'
---
下面这段代码正确的输出是什么？

```go
package main

import "fmt"

func f() {
    defer fmt.Println("D")
    fmt.Println("F")
}

func main() {
    f()
    fmt.Println("M")
}
```

-   A. F M D
-   B. D F M
-   C. F D M

{{< togglecontent label="🔑 答案解析：" >}}

> 🔑 **答案解析：**
>
> C
>
> [在线运行](https://go.dev/play/p/e6iBnPWk-UM)
>
> `defer` 语句在返回之前就会被执行，所以输出顺序是 F D M。

{{< /togglecontent >}}
