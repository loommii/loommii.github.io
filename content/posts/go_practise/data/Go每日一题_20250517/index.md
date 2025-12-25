---
date: '2025-05-17T01:52:26+08:00'
draft: false
title: 'Go每日一题_20250517'
---
下面的代码有几处语法问题，各是什么？

```go
package main
import (
    "fmt"
)
func main() {
    var x string = nil
    if x == nil {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```
./prog.go:8:17: cannot use nil as string value in variable declaration
./prog.go:9:10: invalid operation: x == nil (mismatched types string and untyped nil)
```

### `var x string = nil` 错误

在 Go 语言中，`string` 类型的零值是空字符串 `""`，而不是 `nil`。`nil` 通常用于指针、切片、映射、通道、接口等类型。因此，将 `nil` 赋值给 `string` 类型的变量 `x` 会导致编译错误。

正确的写法应该是：`var x string` 或 `var x string = ""`。

### `if x == nil` 错误

由于 `x` 是 `string` 类型，不能与 `nil` 进行比较。`string` 类型的变量应该与空字符串 `""` 进行比较。

正确的写法应该是：`if x == ""`。

```go
ackage main

import (
    "fmt"
)

func main() {
    var x string = "" // 或者直接写 var x string
    if x == "" {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< /togglecontent >}}
