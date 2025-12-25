---
date: '2024-12-29T12:51:57+08:00'
draft: false
title: 'Go每日一题_146'
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

- A：{"Time": "2020-12-20T00:00:00Z", "N": 5 }；
- B："2020-12-20T00:00:00Z"；
- C：{"N": 5}；
- D：`<nil>`

{{< togglecontent label="🔑 答案解析：" >}}

B
[在线运行](https://go.dev/play/p/ylPvSph0WKu)

### Go 结构体内嵌与继承方法

在 Go 语言中，结构体可以内嵌匿名结构体，从而实现类似继承的效果。例如，下面的结构体内嵌了匿名结构体 `time.Time`：

```go
struct {
    time.Time
    N int
}
```

这种内嵌匿名结构体的方式使得外部结构体继承了 time.Time 的方法集。具体来说，由于 time.Time 实现了 json.Marshaler 接口：

```go
// MarshalJSON implements the json.Marshaler interface.
// The time is a quoted string in RFC 3339 format, with sub-second precision added if present.
func (t Time) MarshalJSON() ([]byte, error) {
    if y := t.Year(); y < 0 || y >= 10000 {
        // RFC 3339 is clear that years are 4 digits exactly.
        // See golang.org/issue/4556#c15 for more discussion.
        return nil, errors.New("Time.MarshalJSON: year outside of range [0,9999]")
    }

    b := make([]byte, 0, len(RFC3339Nano)+2)
    b = append(b, '"')
    b = t.AppendFormat(b, RFC3339Nano)
    b = append(b, '"')
    return b, nil
}
```

因此，这种结构体继承了 Time 类型的 MarshalJSON() 方法。当对该结构体进行 json.Marshal 操作时，效果与对 time.Time 进行相同操作的一致，输出结构为"2020-12-20T00:00:00Z"

{{< /togglecontent >}}
