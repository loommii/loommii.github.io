---
date: '2025-02-23T13:00:00+08:00'
draft: false
title: 'Go每日一题_194'
---

Go 的 map 可以边遍历边删除吗？

{{< togglecontent label="🔑 答案解析：" >}}

这题要分情况分析。

* 若在不同协程内，map 不可以边遍历边删除。map 并不是一个线程安全的数据结构。同时读写一个 map 是未定义的行为，如果被检测到，会直接 panic。

* 若在同一个协程内，map 是可以边遍历边删除的：

    ```go
    for k := range m {
        delete(m, k)
    }
    ```

    但是不建议这样清空 map，建议为 map 重新赋值一个空 map。旧的 map 由 GC 回收。

{{< /togglecontent >}}
