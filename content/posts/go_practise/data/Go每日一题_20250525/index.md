---
date: '2025-05-25T12:23:32+08:00'
draft: false
title: 'Go每日一题_20250525'
---
map是线程安全的吗?如何实现一个线程安全的map

{{< togglecontent label="🔑 答案解析：" >}}

不是并发安全的，有并发写map的场景可以使用官方的sync.Map，自己实现的话上锁，或着通过channel串行化

{{< /togglecontent >}}
