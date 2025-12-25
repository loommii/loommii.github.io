---
date: '2024-12-06T20:44:38+08:00'
draft: false
title: 'Go每日一题_057'
---
下列选项正确的是？

```go
func main() {
    str := "hello"
    str[0] = 'x'
    fmt.Println(str)
}
```

A. hello
B. xello
C. compilation error
{{< togglecontent label="🔑 答案解析：" >}}

参考代码及解析：C。

知识点：Go 语言中的字符串是只读的。

{{< /togglecontent >}}
