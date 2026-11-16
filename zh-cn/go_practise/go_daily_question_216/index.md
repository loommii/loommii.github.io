# Go每日一题_216


下面这段代码输出什么？

```go
package main

import "fmt"

func main() {
	i := 65
	fmt.Println(string(i))
}
```
- A. A
- B. 65
- C. compilation error

{{< details summary="🔑 答案解析：" >}}

参考答案及解析：A。  
[在线运行](https://go.dev/play/p/h8IE-NTMImR)

UTF-8 编码中，十进制数字 65 对应的符号是 A。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_216/  

