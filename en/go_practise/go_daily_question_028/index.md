# Go Daily Question 028


Will the following code compile? If so, what will be the output?

```go
const (
    x = iota
    _
    y
    z = "zz"
    k 
    p = iota
)

func main()  {
    fmt.Println(x,y,z,k,p)
}

```

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer: Compiles and outputs: 0 2 zz zz 5

When defining `const`, if a variable is not followed by a value, it will use the value of the previous variable.

```go
const (
    x = iota
    _ = iota
    y = iota
    z = "zz"
    k = "zz"
    p = iota
)
```

`iota` is equivalent to the line index of the `const` block.

```go
const (
    x = 0
    _ = 1
    y = 2
    z = "zz"
    k = "zz"
    p = 5
)
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_028/  

