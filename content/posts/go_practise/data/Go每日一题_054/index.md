---
date: '2024-12-06T20:44:34+08:00'
draft: false
title: 'Go每日一题_054'
---
以下代码输出什么？

```go
package main

import (
    "encoding/json"
    "fmt"
    "time"
)

func main() {
    t := struct {
        time.Time
        N int
    }{
        time.Date(2020, 12, 20, 0, 0, 0, 0, time.UTC),
        5,
    }

    m, _ := json.Marshal(t)
    fmt.Printf("%s", m)
}
```

A：{"Time": "2020-12-20T00:00:00Z", "N": 5 }；B："2020-12-20T00:00:00Z"；C：{"N": 5}；D：`<nil>`

{{< togglecontent label="🔑 答案解析：" >}}

答 B
题中time.Time 是内嵌到匿名struct 中的，也就是继承了time.Time 。
time.Time 的重写了MarshalJSON 方法因此会按照time.Time  的MarshalJSON 规定的格式输出

{{< /togglecontent >}}
