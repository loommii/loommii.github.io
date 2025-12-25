---
date: '2025-06-06T11:39:31+08:00'
draft: false
title: 'Go每日一题_20250606'
---
下面这段代码输出什么?

```go
package main

import (
       "fmt"
)

func hello(i int) {
       fmt.Println(i)
}
func main() {
       i := 5
       defer hello(i)
       i = i + 10
}
```

{{< togglecontent label="🔑 答案解析：" >}}

5
[在线运行](https://go.dev/play/p/hMcMm9tJw2k)
Go传递只有值传递  
运行到defer hello(i)的时候就已经确定i的值了

下方是defer的结构

```go
type _defer struct {
       heap      bool
       rangefunc bool    // true for rangefunc list
       sp        uintptr // sp at time of defer
       pc        uintptr // pc at time of defer
       fn        func()  // can be nil for open-coded defers
       link      *_defer // next defer on G; can point to either heap or stack!

       // If rangefunc is true, *head is the head of the atomic linked list
       // during a range-over-func execution.
       head *atomic.Pointer[_defer]
}
```

defer 的注册本质上是调用了内置函数 runtime.deferproc

```go
func deferproc(siz int32, fn *funcval)
```

- siz int32：
  - 表示 defer 函数的参数总大小（以字节为单位）。
  - 用于在栈上分配足够的空间来保存参数。
- fn *funcval：
  - 表示 defer 函数的函数值（包括函数指针和捕获的参数）。
  - funcval 是一个运行时内部结构体，用于表示函数的元数据。

因此我们可以得知 注册时就已经确定了捕获的参数

{{< /togglecontent >}}
