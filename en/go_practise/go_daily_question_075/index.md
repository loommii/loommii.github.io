# Go Daily Question 075


What does the following code snippet output?

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

{{< details summary="🔑 Answer Analysis:" >}}
29
29
28
`defer` is Last-In, First-Out (LIFO).
Therefore, // 3 will run first, outputting 29.
Then // 2 runs. Here, a pointer type is passed, so the data is also 29.
Finally, // 1 runs. Because the value of the parameter is determined when the defer statement is executed, it outputs 28.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_075/  

