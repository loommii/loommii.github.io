# Go Daily Question 20250601


What is the output of the following code?

```go
var p *int

func foo() (*int, error) {
    var i int = 5
    return &i, nil
}

func bar() {
    //use p
    fmt.Println(*p)
}

func main() {
    p, err := foo()
    if err != nil {
        fmt.Println(err)
        return
    }
    bar()
    fmt.Println(*p)
}
```

A. 5 5
B. runtime error

{{< details summary="🔑 Answer Analysis:" >}}

B
The global `*p` is `nil`.
In `p, err := foo()`, `p` here is a new local variable and is unrelated to the global `p`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250601/  

