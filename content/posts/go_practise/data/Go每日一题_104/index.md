---
date: '2024-12-06T23:42:43+08:00'
draft: false
title: 'Go每日一题_104'
---
下面这段代码输出结果正确吗？

```go
type Foo struct {
    bar string
}
func main() {
    s1 := []Foo{
        {"A"},
        {"B"},
        {"C"},
    }
    s2 := make([]*Foo, len(s1))
    for i, value := range s1 {
        s2[i] = &value
    }
    fmt.Println(s1[0], s1[1], s1[2])
    fmt.Println(s2[0], s2[1], s2[2])
}
输出：
{A} {B} {C}
&{A} &{B} &{C}
```

{{< togglecontent label="🔑 答案解析：" >}}
go 1.22 后输出是正常的
go < 1.22
for range 循环会重复使用value变量
value的地址都是同一个，因此输出s2 会变成CCC

{{< /togglecontent >}}
