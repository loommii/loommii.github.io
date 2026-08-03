# Go每日一题_177


下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
       var a = [5]int{1, 2, 3, 4, 5}
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

{{< details summary="🔑 答案解析：" >}}

```go
r =  [1 2 3 4 5]
a =  [1 12 13 4 5]
```

[Go在线运行](https://go.dev/play/p/rUJZHJQLR1b)

数组的 range 行为：当使用 range 遍历数组时，Go 会先创建原数组的副本，遍历的是这个副本。因此，循环中对原数组的修改不会影响迭代中的值。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_177/  

