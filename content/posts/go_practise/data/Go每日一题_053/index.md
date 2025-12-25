---
date: '2024-12-06T20:44:33+08:00'
draft: false
title: 'Go每日一题_053'
---
定义一个包内全局字符串变量，下面语法正确的是（多选）：

A. var str string
B. str := ""
C. str = ""
D. var str = ""

{{< togglecontent label="🔑 答案解析：" >}}

A D
关键在 包内全局
B := 只能用到函数没
C 是赋值并不是声明

{{< /togglecontent >}}
