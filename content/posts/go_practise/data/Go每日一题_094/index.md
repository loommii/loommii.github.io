---
date: '2024-12-06T20:45:22+08:00'
draft: false
title: 'Go每日一题_094'
---
下面代码输出什么？

```go
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

参考答案及解析：B，编译报错 cannot assign to struct field m["foo"].x in map。错误原因：对于类似 X = Y的赋值操作，必须知道 X 的地址，才能够将 Y 的值赋给 X，但 go 中的 map 的 value 本身是不可寻址的。

有两个解决办法：

a.使用临时变量

{{< /togglecontent >}}
