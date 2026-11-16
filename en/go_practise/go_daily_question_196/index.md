# Go Daily Question 196



Will the following code compile?

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)
    fmt.Println(&m["qcrao"])
}
```

{{< details summary="🔑 Answer Analysis:" >}}

No.

```go
./prog.go:8:15: invalid operation: cannot take address of m["qcrao"] (map index expression of type int)
```

[Run online](https://go.dev/play/p/F-dYKNEFmvp)
The address of a map element cannot be taken directly.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_196/  

