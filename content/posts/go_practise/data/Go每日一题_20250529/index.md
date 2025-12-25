---
date: '2025-05-29T12:27:56+08:00'
draft: false
title: 'Go每日一题_20250529'
---
下面代码输出什么？

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]Math{
	"foo": Math{2, 3},
}

func main() {
	m["foo"].x = 4
	fmt.Println(m["foo"].x)
}
```

A. 4
B. compilation error

{{< togglecontent label="🔑 答案解析：" >}}

参考答案及解析：B，编译报错 `cannot assign to struct field m["foo"].x in map`。错误原因：对于类似 `X = Y` 的赋值操作，必须知道 X 的地址，才能够将 Y 的值赋给 X，但 Go 中的 map 的 value 本身是不可寻址的。

有两个解决办法：

a. 使用临时变量

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]Math{
	"foo": Math{2, 3},
}

func main() {
	tmp := m["foo"]
	tmp.x = 4
	m["foo"] = tmp
	fmt.Println(m["foo"].x)
}
```

b. 修改数据结构

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]*Math{
	"foo": &Math{2, 3},
}

func main() {
	m["foo"].x = 4
	fmt.Println(m["foo"].x)
	fmt.Printf("%#v", m["foo"]) // %#v 格式化输出详细信息
}
```

References:

*   https://blog.csdn.net/qq_36431213/article/details/82805043
*   https://www.cnblogs.com/DillGao/p/7930674.html
*   https://haobook.readthedocs.io/zh_CN/latest/periodical/201611/zhangan.html
*   https://suraj.pro/post/golang_workaround/
*   https://blog.ijun.org/2017/07/cannot-assign-to-struct-field-in-map.html

{{< /togglecontent >}}
