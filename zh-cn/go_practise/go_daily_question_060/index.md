# Go每日一题_060


以下代码输出什么？

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch1 := make(chan int)
    go fmt.Println(<-ch1)
    ch1 <- 5
    time.Sleep(1 * time.Second)
}
```

A：5、B：不能编译；C：运行时死锁
{{< details summary="🔑 答案解析：" >}}

C
解析 因为 <-ch1 是个参数,可以理解为他要先取出来得到结果后再创建协程 因此运行时死锁。因修改成下方的形式

```go

func main() {
    ch1 := make(chan int)
    go func() {
        fmt.Println(<-ch1)
    }()
    ch1 <- 5
    time.Sleep(1 * time.Second)
}
```

### 函数调用之前，实参就被求值好了

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_060/  

