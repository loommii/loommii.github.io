---
date: '2024-12-06T19:47:08+08:00'
draft: false
title: 'Go每日一题_021'
---
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

{{< togglecontent label="🔑 答案解析：" >}}

答：
[0 0 0 0 0 0 0 0 0 0 1 2 3]
make( 类型 , cap , len)
若只填写 cap, 则 len = cap
因此 s := make([]int, 10)
s 切片的值  [0 0 0 0 0 0 0 0 0 0]
{{< /togglecontent >}}
