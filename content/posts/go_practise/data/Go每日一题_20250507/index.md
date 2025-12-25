---
date: '2025-05-07T00:29:12+08:00'
draft: false
title: 'Go每日一题_20250507'
---
下面代码输出什么？

```go
package main

import "fmt"

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
    var a A = Work{3}
    s := a.(Work)
    fmt.Println(s.ShowA())
    fmt.Println(s.ShowB())
}
```

- A. 13 23
- B. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

A
[在线运行](https://go.dev/play/p/dy8gUTSGZz8)

### **代码分析**

1. **接口和结构体定义**：
   - 定义了两个接口 `A` 和 `B`，分别包含方法 `ShowA()` 和 `ShowB()`。
   - 定义了一个结构体 `Work`，并为其实现了 `ShowA()` 和 `ShowB()` 方法。

2. **接口赋值**：
   - 在 `main` 函数中，`var a A = Work{3}` 将 `Work{3}` 赋值给接口变量 `a`。此时 `a` 的动态类型是 `Work`，动态值是 `Work{3}`。

3. **类型断言**：
   - `s := a.(Work)` 通过类型断言将接口变量 `a` 转换为其具体类型 `Work`。由于 `a` 的动态类型确实是 `Work`，类型断言成功，`s` 是 `Work{3}`。

4. **方法调用**：
   - `s.ShowA()` 调用 `ShowA()` 方法，返回 `w.i + 10`，即 `3 + 10 = 13`。
   - `s.ShowB()` 调用 `ShowB()` 方法，返回 `w.i + 20`，即 `3 + 20 = 23`。

5. **输出结果**：
   - `fmt.Println(s.ShowA())` 输出 `13`。
   - `fmt.Println(s.ShowB())` 输出 `23`。

{{< /togglecontent >}}
