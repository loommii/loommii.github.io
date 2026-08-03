# Go每日一题_181


下面代码里的 counter 的输出值？

```go
package main

import "fmt"

func main() {
    var m = map[string]int{
        "A": 21,
        "B": 22,
        "C": 23,
    }
    counter := 0
    for k, v := range m {
        if counter == 0 {
            delete(m, "A")
        }
        counter++
        fmt.Println(k, v)
    }
    fmt.Println("counter is ", counter)
}
```

- A. 2
- B. 3
- C. 2 或 3

{{< details summary="🔑 答案解析：" >}}

C
[Go在线运行](https://go.dev/play/p/-OKOFSeE6GS)
for range map 是无序的，如果第一次循环到 A，则输出 3；否则输出 2。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_181/  

