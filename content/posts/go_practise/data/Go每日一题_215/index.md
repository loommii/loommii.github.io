---
date: '2025-04-27T23:22:49+08:00'
draft: false
title: 'Go每日一题_215'
---
下面代码下划线处可以填入哪个选项？
```go
package main

import "fmt"

func main() {
	var s1 []int
	var s2 = []int{}
	if __ == nil {
		fmt.Println("yes nil")
	} else {
		fmt.Println("no nil")
	}
}
```

- A. s1
- B. s2
- C. s1、s2 都可以

{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：A。

知识点：nil 切片和空切片。nil 切片和 nil 相等，一般用来表示一个不存在的切片；空切片和 nil 不相等，表示一个空的集合。

{{< /togglecontent >}}
