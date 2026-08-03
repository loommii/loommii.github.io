# Go Daily Question 205


What is the output of the following code and why?

```go
func hello() []string {  
    return nil
}

func main() {  
    h := hello
    if h == nil {
        fmt.Println("nil")
    } else {
        fmt.Println("not nil")
    }
}
```

- A. nil
- B. not nil
- C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B
> `hello` is a Function value. Functions are first-class citizens in Go. Therefore, `if h == nil` is valid.
Since function values have a value (an address), they are also not `nil`.
Functions are also values. They can be passed around like other values.
Function values can be used as function arguments and return values.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_205/  

