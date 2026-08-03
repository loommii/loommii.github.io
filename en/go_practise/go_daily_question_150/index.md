# Go Daily Question 150


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

- A: 5
- B: Cannot compile
- C: Runtime deadlock

{{< details summary="🔑 Answer Analysis:" >}}

C [Run online](https://go.dev/play/p/FsQsswPtOpp)
> fatal error: all goroutines are asleep - deadlock!

Official description of [Go statements](https://go.dev/ref/spec#Go_statements)
> A `go` statement starts a new goroutine (concurrent thread of execution) and executes a function call in that goroutine.

The function value and parameters are evaluated as usual in the calling goroutine, but unlike with a regular call, program execution does not wait for the invoked function to complete.
> The function value and parameters are evaluated as usual in the calling goroutine. But unlike with a regular call, program execution does not wait for the invoked function to complete.

In this problem, a new Goroutine is launched via a `go` statement to run `fmt.Println`. The value of `<-ch1` will be passed to `fmt.Println` and executed in Goroutine b.

- The `main` Goroutine is blocked when evaluating `<-ch1` in `go fmt.Println(<-ch1)`.
- Since `ch1` is an unbuffered channel and no other Goroutine sends data to `ch1`, `<-ch1` will block indefinitely.
- After the `main` Goroutine is blocked, the program cannot continue execution, ultimately leading to a deadlock.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_150/  

