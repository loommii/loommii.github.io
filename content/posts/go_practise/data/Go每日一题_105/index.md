---
date: '2024-12-06T23:42:44+08:00'
draft: false
title: 'Go每日一题_105'
---
下面代码里的 counter 的输出值？

```go
func main() {
    var m = map[string]int{
        "A": 21,
        "B": 22,
        "C": 23,
    }
    counter := 0
    for k, v := range m {
        if counter == 0 {
            delete(m, "A")
        }
        counter++
        fmt.Println(k, v)
    }
    fmt.Println("counter is ", counter)
}
```

- A. 2
- B. 3
- C. 2 或 3

{{< togglecontent label="🔑 答案解析：" >}}

C
map是引用类型 会影响原map

{{< /togglecontent >}}
