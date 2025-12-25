---
date: '2025-03-09T16:05:32+08:00'
draft: false
title: 'Go每日一题_208'
---
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

{{< togglecontent label="🔑 答案解析：" >}}

[在线运行](https://go.dev/play/p/xOWsWj0Evni)

不能通过编译。  
append() 的第二个参数不能直接使用 slice，需使用 … 操作符，将一个切片追加到另一个切片上：  
append(s1,s2…)。或者直接跟上元素，形如：append(s1,1,2,3)。

{{< /togglecontent >}}
