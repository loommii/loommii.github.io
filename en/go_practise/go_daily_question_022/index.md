# Go Daily Question 022


Will the following code compile? If so, what will be the output?

```go
package main

var(
    size := 1024
    max_size = size*2
)

func main() {
    fmt.Println(size,max_size)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: No.

```go
var(
    size := 1024
)
Does not conform to specification.
Problem 1: `var` variable declaration cannot use `:=`.
Problem 2: `:=` can only be used inside a function; this problem uses it for declaring global variables.
```

Reference Analysis: The main point of this problem is the short variable declaration mode, such as: `x := 100`.

#### However, this declaration method has limitations:

- Must use explicit initialization;
- Cannot provide a data type; the compiler will infer it automatically;
- Can only be used inside functions for short declaration mode;
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_022/  

