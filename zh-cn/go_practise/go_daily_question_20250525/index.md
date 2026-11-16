# Go每日一题_20250525


map是线程安全的吗?如何实现一个线程安全的map

{{< details summary="🔑 答案解析：" >}}

不是并发安全的，有并发写map的场景可以使用官方的sync.Map，自己实现的话上锁，或着通过channel串行化

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_20250525/  

