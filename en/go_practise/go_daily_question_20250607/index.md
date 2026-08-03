# Go Daily Question 20250607


What is the output of the following code?

```go
package main

import "fmt"

func main() {
    var a = []int{1, 2, 3, 4, 5}
    var r [5]int

    for i, v := range a {
        if i == 0 {
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
    fmt.Println("r = ", r)
    fmt.Println("a = ", a)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
r =  [1 12 13 4 5]
a =  [1 12 13 4 5]
```

[Go Online Run](https://go.dev/play/p/70_mTGYgNo3)

Although it iterates over a copy of `a`, as long as no reallocation occurs, both the copy and `a` point to the same underlying array, thus the content of `a` can be modified.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250607/  

