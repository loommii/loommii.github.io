---
date: '2024-12-06T20:44:16+08:00'
draft: false
title: 'Go每日一题_039'
---
关于 channel，下面语法正确的是：

```go
A. var ch chan int
B. ch := make(chan int)
C. <- ch
D. ch <-
```

{{< togglecontent label="🔑 答案解析：" >}}
答：ABC

A、B 都是声明 channel；C 读取 channel；
写 channel 是必须带上值，所以 D 错误。

{{< /togglecontent >}}
