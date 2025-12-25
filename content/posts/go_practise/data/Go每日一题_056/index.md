---
date: '2024-12-06T20:44:36+08:00'
draft: false
title: 'Go每日一题_056'
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
    t.ShowA()
}

```

{{< togglecontent label="🔑 答案解析：" >}}

答
"showA"
"showB"

t.ShowA() 会优先调用t自己的ShowA，但是题中未定义着调用父
struct的showA。运行到p.ShowB()时，这里注意是p *People p是父
struct，他会调用p自己的ShowB
因此输出
"showA"
"showB"

{{< /togglecontent >}}
