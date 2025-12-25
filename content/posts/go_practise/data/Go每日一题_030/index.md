---
date: '2024-12-06T20:44:08+08:00'
draft: false
title: 'Go每日一题_030'
---
以下代码能通过编译吗？为什么？

```go
package main

import (
    "fmt"
)

type People interface {
    Speak(string) string
}

type Student struct{}

func (stu *Student) Speak(think string) (talk string) {
    if think == "love" {
        talk = "You are a good boy"
    } else {
        talk = "hi"
    }
    return
}

func main() {
    var peo People = Student{}
    think := "love"
    fmt.Println(peo.Speak(think))
}
```

{{< togglecontent label="🔑 答案解析：" >}}

编译不通过，因为 是*Student重写interface的接口 而不是Student。

{{< /togglecontent >}}
