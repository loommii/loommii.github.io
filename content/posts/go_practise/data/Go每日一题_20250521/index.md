---
date: '2025-05-21T15:28:59+08:00'
draft: false
title: 'Go每日一题_20250521'
---
下面这段代码输出什么？
```go
package main

import (
	"fmt"
)

func main() {
	m := map[int]string{0: "zero", 1: "one"}
	for k, v := range m {
		fmt.Println(k, v)
	}
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答案解析：
参考答案及解析：
```
0 zero
1 one
// 或者
1 one
0 zero
```

[在线运行](https://go.dev/play/p/9oYfWSMuJBr)

map 的输出是无序的。

{{< /togglecontent >}}
