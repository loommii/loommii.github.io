---
date: '2025-06-09T11:37:59+08:00'
draft: false
title: 'Go每日一题_20250609'
---
下面代码里的 counter 的输出值？

```go
package main

import "fmt"

func main() {
	var m = map[string]int{
		"A": 21,
		"B": 22,
		"C": 23,
	}
	counter := 0
	for k, v := range m {
		if counter == 0 {
			delete(m, "A")
		}
		counter++
		fmt.Println(k, v)
	}
	fmt.Println("counter is ", counter)
}
```

- A. 2
- B. 3
- C. 2 或 3

{{< togglecontent label="🔑 答案解析：" >}}

C
[Go在线运行](https://go.dev/play/p/-OKOFSeE6GS)
for range map 是无序的，如果第一次循环到 A，则输出 3；否则输出 2。

{{< /togglecontent >}}
