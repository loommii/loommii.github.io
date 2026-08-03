# Go每日一题_021


写出程序运行的结果：

```go
package main

import (
    "fmt"
)

func main(){
    s := make([]int, 10)

    s = append(s, 1, 2, 3)

    fmt.Println(s)
}
```

{{< details summary="🔑 答案解析：" >}}

答：
[0 0 0 0 0 0 0 0 0 0 1 2 3]
make( 类型 , cap , len)
若只填写 cap, 则 len = cap
因此 s := make([]int, 10)
s 切片的值  [0 0 0 0 0 0 0 0 0 0]
{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_021/  

