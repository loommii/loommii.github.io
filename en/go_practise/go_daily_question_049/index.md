# Go Daily Question 049


What is the output of the following code?

```go
func main() {  
    var i interface{}
    if i == nil {
        fmt.Println("nil")
        return
    }
    fmt.Println("not nil")
}
```

A. nil
B. not nil
C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}
A
For an interface type, the value is `nil` only when both its dynamic value and dynamic type are `nil`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_049/  

