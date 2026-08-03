# Go每日一题_085


下面选项正确的是？

```go
func main() {
    if a := 1; false {
    } else if b := 2; false {
    } else {
        println(a, b)
    }
}
```

A. 1 2
B. compilation error
{{< details summary="🔑 答案解析：" >}}

涉及到 代码块的问题。
具体可以看这篇文章
<https://studygolang.com/articles/35587>
化解出来后该代码变为

```go
{
        a := 1
        if false {

        } else {
            b := 2
            if false {

            } else {
                println(a, b)
            }
        }
    }
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_085/  

