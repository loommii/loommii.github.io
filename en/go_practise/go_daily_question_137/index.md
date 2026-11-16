# Go Daily Question 137


What is the output of the following code?

```go
package main

import (  
    "fmt"
)

func main() {  
    a := [5]int{1, 2, 3, 4, 5}
    t := a[3:4:4]
    fmt.Println(t[0])
}
```

- A.3
- B.4
- C.compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B [Run online](https://go.dev/play/p/z3KqBXFXMm3)

`a` is an array of length 5 with elements 1, 2, 3, 4, 5.

`t := baseStr[low:high:max]`
`low` specifies the starting element index, `high` specifies the ending element index (exclusive), and `max` specifies the maximum index the slice can grow to.

`a[3:4:4]` means starting from index 3, ending before index 4 (exclusive), with a maximum capacity up to index 4.
Therefore, the content of `t` is 4.

`a[3:4:4]` // 4
`a[3:4:5]` // 4
`a[3:4:6]` // Error: `a`'s maximum index is 4 (exclusive), so the maximum can be 5.
`a[3:5:5]` // [4 5]

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_137/  

