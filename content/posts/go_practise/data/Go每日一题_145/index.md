---
date: '2024-12-28T12:34:35+08:00'
draft: false
title: 'Go每日一题_145'
---
定义一个包内全局字符串变量，下面语法正确的是（多选）：

- A. var str string
- B. str := ""
- C. str = ""
- D. var str = ""

{{< togglecontent label="🔑 答案解析：" >}}

 A D

 只有 用var来定义才能在全局定义

 B 只支持局部变量声明
 C 赋值,不是定义

{{< /togglecontent >}}
