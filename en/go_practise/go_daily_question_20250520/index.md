# Go Daily Question 20250520


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

Why is there no output after running?
The purpose of a WaitGroup is to wait for a group of goroutines to finish.
It maintains an internal counter.
The `Add` method adds `delta` to the internal counter.
The `Done` method decrements the WaitGroup counter.
The `Wait` method blocks until the WaitGroup counter becomes 0.

In this problem, goroutines are created in the `for` loop using `go func`.
`wg.Add(1)` and `wg.Done()` are executed when the goroutine runs.

Before the child goroutines run, the main goroutine has already executed `wg.Wait()`. At this point, the counter is 0, so it does not block, and the process terminates after the main goroutine finishes.
Therefore, the child goroutines produce no output.

Modification:

```go
func main() {
    for i := 0; i < N; i++ {
        wg.Add(1) // 1. ADD is placed in the main goroutine.
        go func(i int) {
            defer wg.Done() // 2. It is recommended to execute defer wg.Done() immediately to prevent `Done` from not being executed if a panic occurs.
            println(i)
        }(i)
    }
    wg.Wait()
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250520/  

