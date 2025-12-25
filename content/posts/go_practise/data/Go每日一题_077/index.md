---
date: '2024-12-06T20:45:01+08:00'
draft: false
title: 'Go每日一题_077'
---
下面代码输出什么？

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

    person = &Person{29}
}
```

{{< togglecontent label="🔑 答案解析：" >}}
29
28
28

注意// 2 这里传入的person指向的地址 与后面person = &Person{29}后person 指向的地址不同

{{< /togglecontent >}}
