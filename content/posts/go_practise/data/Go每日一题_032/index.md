---
date: '2024-12-06T20:44:08+08:00'
draft: false
title: 'Go每日一题_032'
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

不能,应为是*Student 实现了People接口的方法。
而现在是Student 赋值给People接口类型。因此编译错误
需要修改为

```go
var peo People = &Student{}
```

{{< /togglecontent >}}
