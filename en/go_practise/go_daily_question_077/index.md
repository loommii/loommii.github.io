# Go Daily Question 077


What is the output of the following code?

<!--more-->

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
29
28
28

Note: // 2 Here, the address pointed to by the passed `person` is different from the address pointed to by `person` after `person = &Person{29}`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_077/  

