---
date: '2025-06-02T11:36:49+08:00'
draft: false
title: 'Go每日一题_20250602'
---
下面这段代码能否正常结束？

```go
func main() {
    v := []int{1, 2, 3}
    for i := range v {
        v = append(v, i)
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

不会出现死循环，能正常结束。

循环次数在循环开始前就已经确定，循环内改变切片的长度，不影响循环次数

{{< /togglecontent >}}