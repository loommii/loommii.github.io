# Go每日一题_131


关于 channel，下面语法正确的是：

- A. var ch chan int
- B. ch := make(chan int)
- C. <- ch
- D. ch <-

{{< details summary="🔑 答案解析：" >}}

A B C

A 声明变量ch 类型为 chan int，并未初始化
B 声明变量ch 类型为 chan int，并初始化
C 读channel，值抛弃
D 错误，写channel必须要值

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_131/  

