---
date: '2024-12-14T11:59:22+08:00'
draft: false
title: 'Go每日一题_131'
---
关于 channel，下面语法正确的是：

- A. var ch chan int
- B. ch := make(chan int)
- C. <- ch
- D. ch <-

{{< togglecontent label="🔑 答案解析：" >}}

A B C

A 声明变量ch 类型为 chan int，并未初始化
B 声明变量ch 类型为 chan int，并初始化
C 读channel，值抛弃
D 错误，写channel必须要值

{{< /togglecontent >}}
