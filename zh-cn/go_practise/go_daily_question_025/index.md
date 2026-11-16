# Go每日一题_025


关于字符串连接，下面语法正确的是？

```
A. str := 'abc' + '123'
B. str := "abc" + "123"
C. str := '123' + "abc"
D. fmt.Sprintf("abc%d", 123)
```

{{< details summary="🔑 答案解析：" >}}

答：BD
'  ' 只能用于单字符 因此AC都无法通过编译

字符串链接推荐使用 `buffer.WriteString()`

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_025/  

