# Go Daily Question 168


What is the output of the following code?

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

{{< details summary="🔑 Answer Analysis:" >}}

```
29
28
28
```

[Run online](https://go.dev/play/p/9GBgmy_wQsn)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_168/  

