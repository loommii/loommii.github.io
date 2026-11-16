# Go Daily Question 164


Will the following code compile? If not, what is the reason? If it compiles, what will be the output?

```go
package main

import "fmt"

func main() {
    list := new([]int)
    list = append(list, 1)
    fmt.Println(list)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

[Run online](https://go.dev/play/p/QM6f730hoOc)

Cannot compile. After `new([]int)`, `list` is a pointer of type `*[]int`, and `append` operation cannot be performed on a pointer. You can initialize it with `make()` before use. Similarly, for maps and channels, it is recommended to initialize them using `make()` or literal syntax, and not `new()`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_164/  

