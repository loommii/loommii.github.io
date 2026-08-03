# Go每日一题_162


<!--more-->

题目：
```go
package main

import "fmt"

func main() {
    s := []int{5, 6, 7}
    p := &s[0]
    fmt.Printf("%p\n", p) // 输出: 0xc000014080
    s = append(s, 8)
    if &s[0] == p {
        fmt.Println("yes")
    } else {
        fmt.Println("no")
    }
}
```

[在线运行](https://go.dev/play/p/8P51tJLzuqM)

{{< details summary="🔑 答案解析：" >}}

输出结果：`no`

当切片发生扩容时，会创建新的底层数组，因此 `&s[0]` 和 `p` 指向的地址会不同。

在 Go 中，`append` 函数可能会导致切片扩容，当切片容量不足以容纳新元素时，会分配一个新的、更大的底层数组，并将原数组的元素复制过去。此时，`s[0]` 的地址会发生变化，不再等于原来的 `p`。

{{< /details >}}

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_162/  

