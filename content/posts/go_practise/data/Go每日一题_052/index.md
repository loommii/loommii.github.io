---
date: '2024-12-06T20:44:31+08:00'
draft: false
title: 'Go每日一题_052'
---
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

{{< togglecontent label="🔑 答案解析：" >}}

答 ：teacher showB
t.ShowB() 会使用自己已有的ShowB() ， 若要使用父struct（People）的ShowB()  需要改为
t.People.ShowB()

{{< /togglecontent >}}
