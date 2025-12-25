---
date: '2024-12-06T20:44:54+08:00'
draft: false
title: 'Go每日一题_071'
---
下面代码输出什么？

```go
func increaseA() int {
    var i int
    defer func() {
        i++
    }()
    return i
}

func increaseB() (r int) {
    defer func() {
        r++
    }()
    return r
}

func main() {
    fmt.Println(increaseA())
    fmt.Println(increaseB())
}
```

A. 1 1
B. 0 1
C. 1 0
D. 0 0
{{< togglecontent label="🔑 答案解析：" >}}
参考答案及解析：B。

知识点：defer、返回值。注意一下，increaseA() 的返回参数是匿名，increaseB() 是具名。
increaseA  return r 已经将r的值 返回了 r再改变并不影响

{{< /togglecontent >}}
