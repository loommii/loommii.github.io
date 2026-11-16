# Go每日一题_018

下面代码有什么问题？

```go
package main

const cl = 100

var bl = 123

func main()  {
    println(&bl,bl)
    println(&cl,cl)
}
```

{{< details summary="🔑 答案解析：" >}}
答: 编译不通过。
cl为 常量。常量无法获取地址

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_018/  

