---
date: '2025-02-22T11:22:39+08:00'
draft: false
title: 'Go每日一题_193'
---
下面两段代码输出什么。

```go
// 1.
func main() {
    s := make([]int, 5)
    s = append(s, 1, 2, 3)
    fmt.Println(s)
}

// 2.
func main() {
    s := make([]int,0)
    s = append(s,1,2,3,4)
    fmt.Println(s)
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```go
// 1.
[0 0 0 0 0 1 2 3]

// 2.
[1 2 3 4]
```

参考解析：这道题考的是使用 append 向 slice 添加元素，第一段代码常见的错误是 [1 2 3]，需要注意。

{{< /togglecontent >}}
