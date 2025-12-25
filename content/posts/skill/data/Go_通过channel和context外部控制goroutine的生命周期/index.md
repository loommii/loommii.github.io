---
date: '2024-12-18T14:48:32+08:00'
draft: true
title: 'Go_通过channel和context外部控制goroutine的生命周期'
---
业务场景。
A接口依赖于第三方接口B、C和D，并通过协程并发访问B接口。当B接口发生异常时，我们需要及时通知C和D接口终止等待。此时，可以通过使用channel和context来外部控制goroutine的生命周期。

## channel

可以通过select语句配合<-channel实现
// TODO
