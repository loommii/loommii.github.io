# Go Daily Question 162


<!--more-->

题目：
```go
package main

import "fmt"

func main() {
    s := []int{5, 6, 7}
    p := &s[0]
    fmt.Printf("%p\n", p) // Output: 0xc000014080
    s = append(s, 8)
    if &s[0] == p {
        fmt.Println("yes")
    } else {
        fmt.Println("no")
    }
}
```

[Run online](https://go.dev/play/p/8P51tJLzuqM)

{{< details summary="🔑 Answer Analysis:" >}}

Output: `no`

When a slice expands, a new underlying array is created. Therefore, the addresses pointed to by `&s[0]` and `p` will be different.

In Go, the `append` function might cause slice expansion. When the slice's capacity is insufficient to accommodate new elements, a new, larger underlying array is allocated, and the elements of the original array are copied to it. At this point, the address of `s[0]` changes and is no longer equal to the original `p`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_162/  

