# Go每日一题_075


下面代码段输出什么？

```go
type Person struct {
    age int
}

func main() {
    person := &Person{28}

    // 1. 
    defer fmt.Println(person.age)

    // 2.
    defer func(p *Person) {
        fmt.Println(p.age)
    }(person)  

    // 3.
    defer func() {
        fmt.Println(person.age)
    }()

    person.age = 29
}
```

{{< details summary="🔑 答案解析：" >}}
29
29
28
defer是先进后出的
因此会运行 // 3 的内容 输出29
后运行 //2 这里传入的是指针类型，因此会数据也是29
最后运行//1 因为入参的值在运行defer就已经定下来了 因此输出28

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_075/  

