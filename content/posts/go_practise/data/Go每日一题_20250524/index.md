---
date: '2025-05-24T12:24:40+08:00'
draft: false
title: 'Go每日一题_20250524'
---
slice是线程安全的吗

{{< togglecontent label="🔑 答案解析：" >}}

- 不是并发安全的，动态扩容会导致指向新的数组。并发写的情况会导致数据丢失的可能。
- 解决方案是上锁，或着通过channel串行化

{{< /togglecontent >}}
