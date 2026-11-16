# Go Daily Question 191



What is the output of the following code, and explain why?

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)

    for key, val := range slice {
        m[key] = &val
    }

    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Before Go 1.22:

```go
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

After Go 1.22:

```go
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

[Go Online Run](https://go.dev/play/p/9TPNWgfwp0J)

Before Go 1.22, the addresses of `key` and `val` in a `for range` loop would not change, so the output would always be 3.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_191/  

