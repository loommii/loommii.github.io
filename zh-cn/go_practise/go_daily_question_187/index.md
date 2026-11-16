# Go每日一题_187


向一个 nil 的切片中 append 数据可以吗?

{{< details summary="🔑 答案解析：" >}}

具体要看声明的时候，如果声明为 `var a []int = nil`，那么就可以 append 数据,若为`var a *[]int = nil` 这不可以

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_187/  

