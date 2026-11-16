# Go每日一题_082


下面的代码有几处语法问题，各是什么？

```go
package main
import (
    "fmt"
)
func main() {
    var x string = nil
    if x == nil {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< details summary="🔑 答案解析：" >}}

1、var x string = nil
string 不能为nil
2、 if x == nil {
string 不能与nil 比较

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_082/  

