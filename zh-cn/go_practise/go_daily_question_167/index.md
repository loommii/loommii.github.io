# Go每日一题_167


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

- A. F M D
- B. D F M
- C. F D M

{{< details summary="🔑 答案解析：" >}}

C

[在线运行](https://go.dev/play/p/e6iBnPWk-UM)

defer 语句在返回之前就会被执行，所以输出顺序是 F D M。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_167/  

