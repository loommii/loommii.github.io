---
date: '2025-06-08T11:39:23+08:00'
draft: false
title: 'Go每日一题_20250608'
---
下面这段代码输出结果正确吗？为什么？

```go
package main

import "fmt"

type Foo struct {
    bar string
}

func main() {
    s1 := []Foo{
        {"A"},
        {"B"},
        {"C"},
    }
    s2 := make([]*Foo, len(s1))
    for i, value := range s1 {
        s2[i] = &value
    }
    fmt.Println(s1[0], s1[1], s1[2])
    fmt.Println(s2[0], s2[1], s2[2])
}

// 输出：
// {A} {B} {C}
// &{A} &{B} &{C}
```

{{< togglecontent label="🔑 答案解析：" >}}

[Go在线运行](https://go.dev/play/p/4uuNEdJyZAC)

这个问题要看Go版本，在Go版本<1.22时输出的结果为

```go
// 输出：
// {A} {B} {C}
// &{C} &{C} &{C}

```

而1.22以后的版本输出的结果是

```go
// 输出：
// {A} {B} {C}
// &{A} &{B} &{C}
```

在1.22以前 for i, value := range s1 中会复用value的地址。  
s2[i] = &value 记录的地址都是同一个地址。
每次循环迭代中value的内容不断的变换，直到遍历到最后一个值即{C}

{{< /togglecontent >}}
