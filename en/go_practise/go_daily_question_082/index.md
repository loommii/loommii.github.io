# Go Daily Question 082


How many syntax issues are there in the following code, and what are they?

```go
package main
import (
    "fmt"
)
func main() {
    var x string = nil
    if x == nil {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

1. `var x string = nil`
   A string cannot be `nil`.
2. `if x == nil {`
   A string cannot be compared with `nil`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_082/  

