# Go Daily Question 165


What is the output of the following code and explain it?

```go
package main

import (
       "runtime"
       "sync"
)

func main() {
       runtime.GOMAXPROCS(1)

       var wg sync.WaitGroup
       wg.Add(3)
       go func(n int) {
              println(n)
              wg.Done()
       }(1)
       go func(n int) {
              println(n)
              wg.Done()
       }(2)
       go func(n int) {
              println(n)
              wg.Done()
       }(3)
       wg.Wait()
}
```

{{< details summary="🔑 Answer Analysis:" >}}

[Run online](https://go.dev/play/p/XqH_qtG5s5C)

```
3
1
2
```

Brief explanation:
A `go` function creates a new Goroutine (G). Each Processor (P) has a record of the next G to run and a local queue (like loading a pistol). G1, G2, G3 enter P sequentially. Eventually, the next G to run is G3, and G1, G2 are in the queue.

Detailed explanation:
`runtime.GOMAXPROCS(1)` limits the number of P's to 1.
A `go` function essentially calls `newproc`, and `newproc` calls `newproc1`.
`newproc1` initializes a new G, and then calls `runqput` to add the G to P. P has a local run queue (`runq`) and a `runnext` slot. The first G enters `runnext`. When the second G arrives, it pushes the first G from `runnext` to the local `runq`. Note that the local `runq` has a length of 256. Therefore, G3 in `runnext` will run first, followed by G1 and G2 sequentially from the queue.
![alt text](image.png)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_165/  

