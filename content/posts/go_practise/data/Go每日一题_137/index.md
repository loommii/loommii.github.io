---
date: '2024-12-21T01:24:56+08:00'
draft: false
title: 'Go每日一题_137'
---
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

- A.3
- B.4
- C.compilation error

{{< togglecontent label="🔑 答案解析：" >}}

B [在线运行](https://go.dev/play/p/z3KqBXFXMm3)

a 为 长度为 5的数组 元素为 1, 2, 3, 4, 5

t := baseStr[low:high:max]
low指定开始元素下标，high指定结束元素下标，max指定切片能增长到的元素下标

a[3:4:4] 的意思是 下标为3开始 到下标4结束 左闭右开 最大为到4下标
因此 t的内容为 4

a[3:4:4]  // 4
a[3:4:5]  // 4
a[3:4:6]  // 错误 a 下标最大为4 开区间 所以能为最大为5
a[3:5:5]  // [4 5]

{{< /togglecontent >}}
