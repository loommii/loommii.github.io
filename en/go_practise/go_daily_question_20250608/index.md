# Go Daily Question 20250608


What is the output of the following code? Why?

```go
package main

import "fmt"

type Foo struct {
    bar string
}

func main() {
    s1 := []Foo{
        {"A"},
        {"B"},
        {"C"},
    }
    s2 := make([]*Foo, len(s1))
    for i, value := range s1 {
        s2[i] = &value
    }
    fmt.Println(s1[0], s1[1], s1[2])
    fmt.Println(s2[0], s2[1], s2[2])
}

// Output:
// {A} {B} {C}
// &{A} &{B} &{C}
```

{{< details summary="🔑 Answer Analysis:" >}}

[Go Online Run](https://go.dev/play/p/4uuNEdJyZAC)

The answer to this question depends on the Go version. For Go versions < 1.22, the output is:

```go
// Output:
// {A} {B} {C}
// &{C} &{C} &{C}

```

For versions 1.22 and later, the output is:

```go
// Output:
// {A} {B} {C}
// &{A} &{B} &{C}
```

Before Go 1.22, in `for i, value := range s1`, the address of `value` would be reused.
The addresses recorded by `s2[i] = &value` would all be the same address.
The content of `value` changes with each loop iteration until it iterates to the last value, which is `{C}`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250608/  

