---
date: '2024-12-06T19:49:55+08:00'
draft: false
title: 'Go每日一题_029'
---
下面赋值正确的是：

A. var x = nil
B. var x interface{} = nil
C. var x string = nil
D. var x error = nil

{{< togglecontent label="🔑 答案解析：" >}}

BD。这道题考的知识点是 nil。nil 只能赋值给指针

A 未指定类型
B 空接口 可以赋值nil
C 字符串本质是个只读切片 不可以赋值nil
D error 本质是个接口类型 可以赋值nil

{{< /togglecontent >}}
