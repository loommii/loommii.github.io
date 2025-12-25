---
date: '2024-12-06T19:49:56+08:00'
draft: false
title: 'Go每日一题_025'
---
关于字符串连接，下面语法正确的是？

```
A. str := 'abc' + '123'
B. str := "abc" + "123"
C. str := '123' + "abc"
D. fmt.Sprintf("abc%d", 123)
```

{{< togglecontent label="🔑 答案解析：" >}}

答：BD
'  ' 只能用于单字符 因此AC都无法通过编译

字符串链接推荐使用 `buffer.WriteString()`

{{< /togglecontent >}}
