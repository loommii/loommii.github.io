# Go Daily Question 206


Will the following code compile? If so, what will be the output?

```go
func GetValue() int {
    return 1
}

func main() {
    i := GetValue()
    switch i.(type) {
    case int:
        println("int")
    case string:
        println("string")
    case interface{}:
        println("interface")
    default:
        println("unknown")
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Compilation fails.
`i.(type)`
The syntax for type assertion is `i.(type)`, where `i` is an interface and `type` is a fixed keyword. It's important to note that only interface types can use type assertion.
Official: <https://go.dev/tour/methods/16>

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_206/  

