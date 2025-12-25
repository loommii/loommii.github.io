---
date: '2024-12-25T00:24:33+08:00'
draft: false
title: 'Go每日一题_142'
---

下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
       var s map[string]int
       delete(s, "h")
       fmt.Println(s["h"])
}
```

- A. runtime panic
- B. 0
- C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

B
[在线运行](https://go.dev/play/p/rfK0pIKBRRx)

- 对未初始化make的map使用delete是不会报错的
- 访问未初始化,返回值类型对应的零值

#### 扩展

对未初始化的map赋值会panic

```go
package main

import "fmt"

func main() {
       var s map[string]int
       s["h"] = 1  // panic: assignment to entry in nil map
       fmt.Println(s["h"])
}
```

[在线运行](https://go.dev/play/p/MScHCsbM6bt)

> 这种错误是可避免的语法错误,建议使用单元测试试着跑一下代码流程

{{< /togglecontent >}}
