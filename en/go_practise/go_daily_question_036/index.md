# Go Daily Question 036


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

Answer: Compilation error.
Type assertion is used here. However, note that only interface types can perform type assertion. `i.(type)` is used here, but the type of `i` is `int`, not an interface.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_036/  

