# Go Daily Question 021


Write the result of the program execution:

```go
package main

import (
    "fmt"
)

func main(){
    s := make([]int, 10)

    s = append(s, 1, 2, 3)

    fmt.Println(s)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer:
[0 0 0 0 0 0 0 0 0 0 1 2 3]
`make(type, cap, len)`
If only `cap` is filled, then `len = cap`.
Therefore, `s := make([]int, 10)`
The value of slice `s` is `[0 0 0 0 0 0 0 0 0 0]`
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_021/  

