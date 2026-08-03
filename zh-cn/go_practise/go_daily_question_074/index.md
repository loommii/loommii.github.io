# Go每日一题_074


以下代码输出什么？

```go
package main

import "fmt"

func app() func(string) string {
    t := "Hi"
    c := func(b string) string {
        t = t + " " + b
        return t
    }
    return c
}

func main() {
    a := app()
    b := app()
    a("go")
    fmt.Println(b("All"))
    fmt.Println(a("All"))
}
```

A：Hi All；B：Hi go All；C：Hi；D：go Al
{{< details summary="🔑 答案解析：" >}}

闭包
    fmt.Println(b("All")) 输出  A （Hi All）
    fmt.Println(a("All")) 输出  B  （Hi go All）

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_074/  

