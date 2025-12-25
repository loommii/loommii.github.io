---
date: '2024-12-16T13:37:34+08:00'
draft: false
title: 'Go每日一题_133'
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

答 18

Go参数go只有值传递,函数调用每次都会创建一个新的副本，副本的值=原来的值。
...int 本质上是个切片。切片的结构是 `cap lan 底层数组指针`

因此 `num ...int` 和 `i...` 的值内容是相同的。但是变量地址是不通的。

题目中没有触发扩容，因此2个切片指向同一个底层数组，因此num[0] = 18 会影响到外面的 i[0]

在线运行：
>本题: <https://go.dev/play/p/ne8bmUzhqsN>
>
>num触发扩容后修改: <https://go.dev/play/p/Y3BhAEj3CjL>
>
>copy深拷贝切片: <https://go.dev/play/p/QZwRA6jL48z>

{{< /togglecontent >}}
