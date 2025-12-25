---
date: '2024-12-06T20:44:18+08:00'
draft: false
title: 'Go每日一题_041'
---
下面这段代码输出什么？

```go
func hello(num ...int) {  
    num[0] = 18
}

func main() {  
    i := []int{5, 6, 7}
    hello(i...)
    fmt.Println(i[0])
}
```

A.18
B.5
C.Compilation error
{{< togglecontent label="🔑 答案解析：" >}}

答： A 18
解析：... 变质是传切片，又因为未发生切片扩容，因此这2个切片指的底层数组是同一个。因此i[0]被改为18

这里对原题目做出小改动

```go
package main

import "fmt"

func hello(num ...int) {
    num = append(num, 1)
    num[0] = 18

}
func main() {
    i := []int{5, 6, 7}
    hello(i...)
    fmt.Println(i[0])
}
```

改动后 num的切片发送了扩容，导致2个切片指的底层数组不通，因此不会影响到 i切片 最终print 输出 5
{{< /togglecontent >}}
