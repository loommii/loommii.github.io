# Go Daily Question 038


What is wrong with the following code?

```go
package main

import (
    "sync"
)

const N = 10

var wg = &sync.WaitGroup{}

func main() {
    for i := 0; i < N; i++ {
        go func(i int) {
            wg.Add(1)
            println(i)
            defer wg.Done()
        }(i)
    }
    wg.Wait()
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: The output is not unique, and the code has risks; not all `go` statements may be executed.
Analysis:

```go
var wg = &sync.WaitGroup{}
wg.Add(1)
wg.Done()
wg.Wait()
```

This usage is similar to a stack. `wg.Wait()` checks if there are any records in `wg`. If there are, it blocks until the stack becomes 0 before becoming active.
The way it's written here has a problem. `wg.Add(1)` is placed inside the goroutine, which means `wg.Wait()` might evaluate before `wg.Add(1)` has been executed for all goroutines.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_038/  

