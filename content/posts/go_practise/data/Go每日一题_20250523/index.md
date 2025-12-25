---
date: '2025-05-23T15:37:19+08:00'
draft: false
title: 'Go每日一题_20250523'
---
以下代码输出什么：

```go
package main

func main() {
  var x *struct {
    s [][32]byte
  }
  
  println(len(x.s[99]))
}
```

A：运行时 panic；B：32；C：编译错误；D：0
{{< togglecontent label="🔑 答案解析：" >}}

答案B

- 返回结果总是 int；
- 返回结果有可能是常量；
- 有时对函数参数不求值，即编译期确定返回值；

这里 len(x.s[99])
因为s的切片类型是[32]byte，因此得len(x.s[99]) = 32

这里要清楚 len 和 cap 是不会panic的是编译器完成的功能
表达式 x.s[99] 没有包含 channel 接收也不是函数调用，因此在编译阶段就已经确定返回的值

{{< /togglecontent >}}
