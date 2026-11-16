# Go每日一题_039


关于 channel，下面语法正确的是：

```go
A. var ch chan int
B. ch := make(chan int)
C. <- ch
D. ch <-
```

{{< details summary="🔑 答案解析：" >}}
答：ABC

A、B 都是声明 channel；C 读取 channel；
写 channel 是必须带上值，所以 D 错误。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_039/  

