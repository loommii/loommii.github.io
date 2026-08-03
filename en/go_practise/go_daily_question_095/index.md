# Go Daily Question 095


Output of the following code:

```go
package main

import "sync"

func main() {
    var wg sync.WaitGroup
    foo := make(chan int)
    bar := make(chan int)
    wg.Add(1)
    go func() {
        defer wg.Done()
        select {
        case foo <- <-bar:
        default:
            println("default")
        }
    }()
    wg.Wait()
}
```

A: default
B: panic
{{< details summary="🔑 Answer Analysis:" >}}

Conventionally, one might expect the `default` branch of the `select` statement in `go func` to execute, and the program to run normally. However, the result is not that, but a deadlock. You can test this via: <https://play.studygolang.com/p/kF4pOjYXbXf.>

The reason is explained in the article as well. The Go language specification states:
> For all the cases in the statement, the channel operands of receive operations and the channel and right-hand-side expressions of send statements are evaluated exactly once, in source order, upon entering the “select” statement. The result is a set of channels to receive from or send to, and the corresponding values to send. Any side effects in that evaluation will occur irrespective of which (if any) communication operation is selected to proceed. Expressions on the left-hand side of a RecvStmt with a short variable declaration or assignment are not yet evaluated.

Returning to this problem, `case foo <- <-bar:`:
Here, no matter which case `select` chooses, `<-bar` will be executed first, leading to a panic.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_095/  

