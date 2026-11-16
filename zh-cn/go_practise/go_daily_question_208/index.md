# Go每日一题_208


下面这段代码能否通过编译，如果可以，输出什么？

```go
package main

import "fmt"

func main() {
    s1 := []int{1, 2, 3}
    s2 := []int{4, 5}
    s1 = append(s1, s2)
    fmt.Println(s1)
}
```

{{< details summary="🔑 答案解析：" >}}

[在线运行](https://go.dev/play/p/xOWsWj0Evni)

不能通过编译。  
append() 的第二个参数不能直接使用 slice，需使用 … 操作符，将一个切片追加到另一个切片上：  
append(s1,s2…)。或者直接跟上元素，形如：append(s1,1,2,3)。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_208/  

