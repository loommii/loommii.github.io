# Go每日一题_012

下面这段代码能否通过编译，不能的话原因是什么；如果通过，输出什么。

```go
func main() {
    list := new([]int)
    list = append(list, 1)
    fmt.Println(list)
}
```

{{< details summary="🔑 答案解析：" >}}

不能通过编译，new([]int) 之后的 list 是一个 *[]int 类型的指针，不能对指针执行 append 操作。可以使用 make() 初始化之后再用。同样的，map 和 channel 建议使用 make() 或字面量的方式初始化，不要用 new() 。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_012/  

