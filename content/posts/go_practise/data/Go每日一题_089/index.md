---
date: '2024-12-06T20:45:16+08:00'
draft: false
title: 'Go每日一题_089'
---
下面这段代码输出什么？为什么？

```go
func (i int) PrintInt ()  {
    fmt.Println(i)
}

func main() {
    var i int = 1
    i.PrintInt()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

会编译错误，只有自定义类型且与类型定义在同一个包内才能创建对应的方法

参考答案及解析：B。

基于类型创建的方法必须定义在同一个包内，上面的代码基于 int 类型创建了 PrintInt() 方法，由于 int 类型和方法 PrintInt() 定义在不同的包内，所以编译出错。解决的办法可以定义一种新的类型：

```go
type Myint int

func (i Myint) PrintInt ()  {
    fmt.Println(i)
}

func main() {
    var i Myint = 1
    i.PrintInt()
}
```

{{< /togglecontent >}}
