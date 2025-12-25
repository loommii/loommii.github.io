---
date: '2025-01-21T22:53:38+08:00'
draft: false
title: 'Go每日一题_168'
---
下面代码输出什么？

```go
package main

import "fmt"

type Person struct {
    age int
}

func main() {
    person := &Person{28}

    // 1.
    defer fmt.Println(person.age)

    // 2.
    defer func(p *Person) {
        fmt.Println(p.age)
    }(person)

    // 3.
    defer func() {
        fmt.Println(person.age)
    }()

    person = &Person{29}
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```
29
28
28
```

[在线运行](https://go.dev/play/p/9GBgmy_wQsn)

{{< /togglecontent >}}
