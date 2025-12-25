---
date: '2025-01-10T12:46:04+08:00'
draft: false
title: 'Go每日一题_157'
---
下面代码中 A B 两处应该怎么修改才能顺利编译？

```go
func main() {
    var m map[string]int        //A
    m["a"] = 1
    if v := m["b"]; v != nil {  //B
        fmt.Println(v)
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

// A  
 A 处只声明了map m ,并没有分配内存空间未初始化的map，写入会panic，

 因此需要将 var m map[string]int 改为 m := make(map[string]int)

// B  
key 为 b 的元素不存在的时候，v 会返回值类型对应的零值，类型为int因此v为0。类型int != nil 是不能通过编译的类型不匹配

因此需要v != nil 改为 v != 0

```go
package main

import (
    "fmt"
)

func main() {
    m := make(map[string]int) //A
    m["a"] = 1
    if v := m["b"]; v != 0 { //B
        fmt.Println(v)
    }
}
```

[在线编译](https://go.dev/play/p/SqJ3yFfgw4I)

{{< /togglecontent >}}
