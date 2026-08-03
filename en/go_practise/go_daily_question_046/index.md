# Go Daily Question 046


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

A.3
B.4
C.compilation error
{{< details summary="🔑 Answer Analysis:" >}}

Answer: B
Analysis: `t := a[3:4:4]`
A new slice `t` is generated based on slice `a`. The start of `t` points to the position of `a[3]`, and stops at `a[4]`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_046/  

