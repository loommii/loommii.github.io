# Go每日一题_052


下面这段代码输出什么？

```go
type People struct{}

func (p *People) ShowA() {
    fmt.Println("showA")
    p.ShowB()
}
func (p *People) ShowB() {
    fmt.Println("showB")
}

type Teacher struct {
    People
}

func (t *Teacher) ShowB() {
    fmt.Println("teacher showB")
}

func main() {
    t := Teacher{}
    t.ShowB()
}

```

{{< details summary="🔑 答案解析：" >}}

答 ：teacher showB
t.ShowB() 会使用自己已有的ShowB() ， 若要使用父struct（People）的ShowB()  需要改为
t.People.ShowB()

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_052/  

