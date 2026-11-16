# Go Daily Question 081


What is the output of the following code?

```go
package main

import (
    "fmt"
)

func main() {
    var ans float64 = 15 + 25 + 5.2
    fmt.Println(ans)
}
```

A: Cannot compile; B: 45; C: 45.2; D: 45.0

{{< details summary="🔑 Answer Analysis:" >}}

C
Numbers are untyped constants.
Or rather, they are arbitrary types.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_081/  

