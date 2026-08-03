# Go每日一题_046


下面这段代码输出什么？

```go
package main

import (  
    "fmt"
)

func main() {  
    a := [5]int{1, 2, 3, 4, 5}
    t := a[3:4:4]
    fmt.Println(t[0])
}
```

A.3
B.4
C.compilation error
{{< details summary="🔑 答案解析：" >}}

答B
解析 t := a[3:4:4]
基于a切片生成一个新切片t ,该t的起始指向a[3]的位置,到a[4]停止

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_046/  

