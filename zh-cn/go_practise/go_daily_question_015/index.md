# Go每日一题_015

Go 1.15 中 var i interface{} = a 会有额外堆内存分配吗？
具体代码是：

```go
var a  int = 3
// 以下有额外内存分配吗？
var i interface{} = a
```

{{< details summary="🔑 答案解析：" >}}

正确答案:不会

解析:
*Go 1.15 发行说明**在 runtime 部分中提到了一个有趣的改进：

>Converting a small integer value into an interface value no longer causes allocation.

意思是说，将小整数转换为接口值不再需要进行内存分配。小整数是指 `0 到 255` 之间的数。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_015/  

