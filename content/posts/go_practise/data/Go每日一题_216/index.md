---
date: '2025-04-28T00:31:44+08:00'
draft: false
title: 'Go每日一题_216'
---
下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
	i := 65
	fmt.Println(string(i))
}
```
- A. A
- B. 65
- C. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：A。  
[在线运行](https://go.dev/play/p/h8IE-NTMImR)

UTF-8 编码中，十进制数字 65 对应的符号是 A。

{{< /togglecontent >}}

