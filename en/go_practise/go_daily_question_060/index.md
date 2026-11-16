# Go Daily Question 060


What is the output of the following code?

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch1 := make(chan int)
    go fmt.Println(<-ch1)
    ch1 <- 5
    time.Sleep(1 * time.Second)
}
```

A: 5, B: Cannot compile; C: Runtime deadlock
{{< details summary="🔑 Answer Analysis:" >}}

C
Analysis: Because `<-ch1` is a parameter, it can be understood that it needs to be evaluated to get a result before creating the goroutine. Therefore, it leads to a runtime deadlock. It should be modified as follows:

```go

func main() {
    ch1 := make(chan int)
    go func() {
        fmt.Println(<-ch1)
    }()
    ch1 <- 5
    time.Sleep(1 * time.Second)
}
```

### Before a function call, actual arguments are already evaluated.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_060/  

