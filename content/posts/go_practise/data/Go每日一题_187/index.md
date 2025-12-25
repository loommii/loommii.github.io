---
date: '2025-02-16T23:34:41+08:00'
draft: false
title: 'Go每日一题_187'
---
向一个 nil 的切片中 append 数据可以吗?

{{< togglecontent label="🔑 答案解析：" >}}

具体要看声明的时候，如果声明为 `var a []int = nil`，那么就可以 append 数据,若为`var a *[]int = nil` 这不可以

{{< /togglecontent >}}
