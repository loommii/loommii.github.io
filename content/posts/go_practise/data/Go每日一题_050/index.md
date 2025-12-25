---
date: '2024-12-06T20:44:29+08:00'
draft: false
title: 'Go每日一题_050'
---
下面这段代码输出什么？

```go
func main() {  
    s := make(map[string]int)
    delete(s, "h")
    fmt.Println(s["h"])
}
```

A. runtime panic
B. 0
C. compilation error
{{< togglecontent label="🔑 答案解析：" >}}

B 0
delete 一个不存在的key并不会panic
输出一个不存在的key会输出类型的零值

扩展

```go
func main() {
    var s map[string]int
    delete(s, "h")
    s["h"] = 1
    fmt.Println(s["h"])
}
```

delete nil map 程序也不会panic
但是往nil map 写数据会panic
{{< /togglecontent >}}
