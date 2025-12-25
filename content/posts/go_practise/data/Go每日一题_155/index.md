---
date: '2025-01-08T13:03:00+08:00'
draft: false
title: 'Go每日一题_155'
---
下面这段代码输出什么？

```go
package main

import (
    "fmt"
)

type A interface {
    ShowA() int
}

type B interface {
    ShowB() int
}

type Work struct {
    i int
}

func (w Work) ShowA() int {
    return w.i + 10
}

func (w Work) ShowB() int {
    return w.i + 20
}

func main() {
    c := Work{3}
    var a A = c
    var b B = c
    fmt.Println(a.ShowA())
    fmt.Println(b.ShowB())
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```
13
23
```

[在线运行](https://go.dev/play/p/tzzCLmrk2Ns)

知识点：接口。

[Go官方文档-Interface_types](https://golang.google.cn/ref/spec#Interface_types)  

### 本题代码解析过程

1. **结构体和接口实现**：
   - `Work` 结构体实现了接口 `A` 的 `ShowA()` 方法，返回 `w.i + 10`。
   - `Work` 结构体也实现了接口 `B` 的 `ShowB()` 方法，返回 `w.i + 20`。

2. **变量赋值**：
   - `c := Work{3}`：创建了一个 `Work` 类型的实例 `c`，其字段 `i` 的值为 `3`。
   - `var a A = c`：将 `c` 赋值给接口类型 `A` 的变量 `a`。此时，`a` 可以调用 `ShowA()` 方法。
   - `var b B = c`：将 `c` 赋值给接口类型 `B` 的变量 `b`。此时，`b` 可以调用 `ShowB()` 方法。

3. **方法调用**：
   - `a.ShowA()`：调用 `Work` 的 `ShowA()` 方法，返回 `3 + 10 = 13`。
   - `b.ShowB()`：调用 `Work` 的 `ShowB()` 方法，返回 `3 + 20 = 23`。

4. **输出结果**：
   - `fmt.Println(a.ShowA())` 输出 `13`。
   - `fmt.Println(b.ShowB())` 输出 `23`。

{{< /togglecontent >}}
