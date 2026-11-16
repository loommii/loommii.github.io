# Go Daily Question 089


What is the output of the following code? Why?

```go
func (i int) PrintInt ()  {
    fmt.Println(i)
}

func main() {
    var i int = 1
    i.PrintInt()
}
```

{{< details summary="🔑 Answer Analysis:" >}}

It will result in a compilation error. Methods can only be created for custom types and must be defined within the same package as the type.

Reference Answer and Analysis: B.

Methods based on a type must be defined within the same package. The code above creates a `PrintInt()` method based on the `int` type. Since `int` type and the `PrintInt()` method are defined in different packages, it results in a compilation error. A solution is to define a new type:

```go
type Myint int

func (i Myint) PrintInt ()  {
    fmt.Println(i)
}

func main() {
    var i Myint = 1
    i.PrintInt()
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_089/  

