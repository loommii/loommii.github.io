# Go每日一题_178


下面这段代码输出什么？

```go
package main

import "fmt"

func change(s ...int) {
    s = append(s, 3)
}

func main() {
    slice := make([]int, 5, 5)
    slice[0] = 1
    slice[1] = 2
    change(slice...)
    fmt.Println(slice)
    change(slice[0:2]...)
    fmt.Println(slice)
}

```

{{< details summary="🔑 答案解析：" >}}

```go
[1 2 0 0 0]
[1 2 3 0 0]
```

[Go在线运行](https://go.dev/play/p/sJ68ZpNd2Tj)

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_178/  

