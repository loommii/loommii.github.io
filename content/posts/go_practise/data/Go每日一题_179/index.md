---
date: '2025-02-08T22:46:18+08:00'
draft: false
title: 'Go每日一题_179'
---
下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
    var a = []int{1, 2, 3, 4, 5}
    var r [5]int

    for i, v := range a {
        if i == 0 {
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
    fmt.Println("r = ", r)
    fmt.Println("a = ", a)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```go
r =  [1 12 13 4 5]
a =  [1 12 13 4 5]
```

[Go在线运行](https://go.dev/play/p/70_mTGYgNo3)

遍历的虽然是a的副本，但是在不发生扩容的情况下，副本和a指向的都是同一个底层数组，因此可以修改到a的内容

{{< /togglecontent >}}
