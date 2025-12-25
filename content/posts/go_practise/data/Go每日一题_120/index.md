---
date: '2024-12-06T23:43:03+08:00'
draft: false
title: 'Go每日一题_120'
---
下面代码中，x 已声明，y 没有声明，判断每条语句的对错。

```go
A: x, _ := f()
B: x, _ = f()
C: x, y := f()
D: x, y = f()

```

{{< togglecontent label="🔑 答案解析：" >}}

A错、B对、C对、D错

{{< /togglecontent >}}
