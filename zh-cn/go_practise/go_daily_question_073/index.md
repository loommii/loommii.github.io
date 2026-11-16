# Go每日一题_073


f1()、f2()、f3() 函数分别返回什么？

```go
func f1() (r int) {
    defer func() {
        r++
    }()
    return 0
}


func f2() (r int) {
    t := 5
    defer func() {
        t = t + 5
    }()
    return t
}


func f3() (r int) {
    defer func(r int) {
        r = r + 5
    }(r)
    return 1
}

```

{{< details summary="🔑 答案解析：" >}}

f1 1
f2 5
f3 1

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_073/  

