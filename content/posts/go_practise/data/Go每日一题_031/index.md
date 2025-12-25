---
date: '2024-12-06T20:44:08+08:00'
draft: false
title: 'Go每日一题_031'
---
以下代码打印出来什么内容，说出为什么。

```go
package main

import (
    "fmt"
)

type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func live() People {
    var stu *Student
    return stu
}

func main() {
    if live() == nil {
        fmt.Println("AAAAAAA")
    } else {
        fmt.Println("BBBBBBB")
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

输出的是BBBBBBB
简单解释一下，就是接口的底层其实是有2个指针 一个指向类型,一个指向值。

```text
//伪代码
指针{
    类型指针
    值指针
}
```

live()函数中
var stu *Student 类型 返回是 Prople指针
返回的内容
接口{
    类型指针 ->*Student
    值指针  -> nil
}
if 接口类型 == nil
会判断类型指针 和 值指针 2个都为nil 结果才为T
{{< /togglecontent >}}
