# Go每日一题_20250524


slice是线程安全的吗

{{< details summary="🔑 答案解析：" >}}

- 不是并发安全的，动态扩容会导致指向新的数组。并发写的情况会导致数据丢失的可能。
- 解决方案是上锁，或着通过channel串行化

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_20250524/  

