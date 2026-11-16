# Go每日一题_062


下面代码下划线处可以填入哪个选项？

```go
func main() {
    var s1 []int
    var s2 = []int{}
    if __ == nil {
        fmt.Println("yes nil")
    }else{
        fmt.Println("no nil")
    }
}
```

- A. s1
- B. s2
- C. s1、s2 都可以
{{< details summary="🔑 答案解析：" >}}
C
s1 输出是yes nil
s2 输出是no nil

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_062/  

