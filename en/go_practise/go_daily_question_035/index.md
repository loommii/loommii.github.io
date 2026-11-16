# Go Daily Question 035


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

A. nil
B. not nil
C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B. In this problem, the function `hello` is assigned to variable `h`, rather than the return value of the function (i.e., it's not a function call). Therefore, the output is `not nil`. Note that functions are first-class citizens in Go.

If modified to:

```go
func hello() []string {  
    return nil
}

func main() {  
    h := hello()
    if h == nil {
        fmt.Println("nil")
    } else {
        fmt.Println("not nil")
    }
}
```

Then the answer would be A.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_035/  

