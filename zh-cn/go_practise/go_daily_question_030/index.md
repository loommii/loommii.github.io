# Go每日一题_030


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

{{< details summary="🔑 答案解析：" >}}

编译不通过，因为 是*Student重写interface的接口 而不是Student。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_030/  

