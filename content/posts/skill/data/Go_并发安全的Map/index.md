---
date: '2024-12-16T20:27:21+08:00'
draft: true
title: 'Go_并发安全的Map'
---
在之前的文章<<[Go: Map 是并发安全的吗？](../go_map是并发安全的吗)>>我们了解到map 在进行更新时，map 访问是不安全的。在官方的QA中也提供了解决方案`sync.Map`

### sync.Map

### Map + 读写锁

### Map + 互斥锁 + channel

TODO : 具体代码待补充
