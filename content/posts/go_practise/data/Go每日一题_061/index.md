---
date: '2024-12-06T20:44:42+08:00'
draft: false
title: 'Go每日一题_061'
---
一次两道题，因为相关的。

1、以下代码输出什么？

```go
package main

import (
    "fmt"
)

func main() {
    a := []int{2: 1}
    fmt.Println(a)
}
```

A：编译错误；B：[2 1]；C：[0 0 1]；D：[0 1]

2、以下代码输出什么？

```go
package main

func main() {
    var x = []int{4: 44, 55, 66, 1: 77, 88}
    println(len(x), x[2])
}
```

A：5 66；B：5 88；C：7 88；D：以上都不对

{{< togglecontent label="🔑 答案解析：" >}}

C C
a := []int{2: 1} 下表2 值为1
因此初始化出来的切片 cap 3 len 3 内容是  0 0 1, int的零值为0
    var x = []int{4: 44, 55, 66, 1: 77, 88}
这里要慢慢看
4: 44  下标4的值为44 ， 后面的55没有制定下标，默认是前一个+1 类似 5：55 ， 66就是 6:66，
1: 77 下标 1 值为 77  ，88 就是 2 ：88
因此初始化出来的切片 cap 7 len 7 内容是  0 77 88 0 44 55 66
[0 77 88 0 44 55 66]
{{< /togglecontent >}}
