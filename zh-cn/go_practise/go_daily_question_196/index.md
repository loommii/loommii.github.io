# Go每日一题_196



以下代码是否能编译通过？

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)
    fmt.Println(&m["qcrao"])
}
```

{{< details summary="🔑 答案解析：" >}}

不能.

```go
./prog.go:8:15: invalid operation: cannot take address of m["qcrao"] (map index expression of type int)
```

[在线运行](https://go.dev/play/p/F-dYKNEFmvp)
map 的元素不能直接取地址。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_196/  

