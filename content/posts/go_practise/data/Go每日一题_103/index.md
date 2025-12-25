---
date: '2024-12-06T23:42:42+08:00'
draft: false
title: 'Go每日一题_103'
---
下面这段代码输出什么？

```go
func main() {
    var a = []int{1, 2, 3, 4, 5}
    var r [5]int

    for i, v := range a {
        if i == 0 {
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
    fmt.Println("r = ", r)
    fmt.Println("a = ", a)
}
```

{{< togglecontent label="🔑 答案解析：" >}}
r =  [1 12 13 4 5]
a =  [1 12 13 4 5]
rang a 实际是在变量a的副本。由于切片的结构，这2个切片都会指向同一个底层数组。因此改动    a[1] = 12 ， a[2] = 13 会影响v的结构

我们可以做验证 ，将a在循环中扩容。这时候a和副本切片指向的就不是同一个底层数组，改动将不会影响副本

```go
for i, v := range a {
        if i == 0 {
            a = append(a, v)
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
```

{{< /togglecontent >}}
