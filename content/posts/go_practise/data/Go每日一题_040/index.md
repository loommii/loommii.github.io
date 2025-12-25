---
date: '2024-12-06T20:44:17+08:00'
draft: false
title: 'Go每日一题_040'
---
下面这段代码输出什么？

```go
type person struct {  
    name string
}

func main() {  
    var m map[person]int
    p := person{"mike"}
    fmt.Println(m[p])
}
```

A.0
B.1
C.Compilation error
{{< togglecontent label="🔑 答案解析：" >}}
答 ：A 0

m 是一个 map，值是 nil。从 nil map 中取值不会报错，而是返回相应的零值，这里值是 int 类型，因此返回 0。

注意 ： nil map是可以取值，但是不能赋值。会导致程序panic的

```go
package main

import "fmt"

type person struct {
    name string
}

func main() {
    var m map[person]int
    p := person{"mike"}
    m[p] = 2
    fmt.Println(m[p])
} 
```

运行结果：panic: assignment to entry in nil map

{{< /togglecontent >}}
