---
date: '2024-12-06T20:45:10+08:00'
draft: false
title: 'Go每日一题_084'
---
下面这段代码输出什么？为什么？

```go
func main() {
    s1 := []int{1, 2, 3}
    s2 := s1[1:]
    s2[1] = 4
    fmt.Println(s1)
    s2 = append(s2, 5, 6, 7)
    fmt.Println(s1)
}

```

{{< togglecontent label="🔑 答案解析：" >}}

s1 [1,2,4]
s2 [2,4,5,6,7]

{{< /togglecontent >}}
