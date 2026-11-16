# Go每日一题_081


以下代码输出什么？

```go
package main

import (
    "fmt"
)

func main() {
    var ans float64 = 15 + 25 + 5.2
    fmt.Println(ans)
}
```

A：不能编译；B：45；C：45.2；D：45.0

{{< details summary="🔑 答案解析：" >}}

C
数字是无类型常量
或者说是任意类型

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_081/  

