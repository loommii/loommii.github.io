# Go Daily Question 20250511


What is the correct output of the following code?

```go
package main

import "fmt"

func f() {
    defer fmt.Println("D")
    fmt.Println("F")
}

func main() {
    f()
    fmt.Println("M")
}
```

-   A. F M D
-   B. D F M
-   C. F D M

{{< details summary="🔑 Answer Analysis:" >}}

> 🔑 **Answer Analysis:**
>
> C
>
> [Run online](https://go.dev/play/p/e6iBnPWk-UM)
>
> The `defer` statement is executed before returning, so the output order is F D M.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250511/  

