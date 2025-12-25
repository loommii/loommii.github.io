---
date: '2025-05-15T16:42:50+08:00'
draft: false
title: 'Go每日一题_20250515'
---
下面 A、B 两处应该填入什么代码，才能确保顺利打印出结果？

```go

type S struct {
    m string
}

func f() *S {
    return __  //A
}

func main() {
    p := __    //B
    fmt.Println(p.m) //print "foo"
}
```

{{< togglecontent label="🔑 答案解析：" >}}

A. &S{"foo"}
B. *f() 或者 f()

f() 函数返回参数是指针类型，所以可以用 & 取结构体的指针；B 处，如果填 *f()，则 p 是 S 类型；如果填 f()，则 p 是*S 类型，不过都可以使用 p.m 取得结构体的成员。

{{< /togglecontent >}}
