---
date: '2024-12-06T23:42:48+08:00'
draft: false
title: 'Go每日一题_108'
---
关于类型转化，下面选项正确的是？

```go
A.
type MyInt int
var i int = 1
var j MyInt = i

B.
type MyInt int
var i int = 1
var j MyInt = (MyInt)i

C.
type MyInt int
var i int = 1
var j MyInt = MyInt(i)

D.
type MyInt int
var i int = 1
var j MyInt = i.(MyInt)

```

{{< togglecontent label="🔑 答案解析：" >}}

C

{{< /togglecontent >}}
