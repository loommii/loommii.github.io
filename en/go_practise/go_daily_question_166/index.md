# Go Daily Question 166


Yesterday there were only 3 G's. What would be the output if the number of G's was changed to 257?

```go
package main

import (
    "fmt"
    "runtime"
    "sync"
)

func main() {
    runtime.GOMAXPROCS(1)

    var wg sync.WaitGroup
    wg.Add(257)
    for i := 1; i <= 257; i++ {
        go func(i int) {
            fmt.Println(i)
            wg.Done()
        }(i)
    }
    wg.Wait()
}
```

{{< details summary="🔑 Answer Analysis:" >}}

[Run online](https://go.dev/play/p/pizDb_St91u)

```
257
1
2
3
...
255
256
```

The result is consistent with the case of 3 Goroutines, because the local runq's capacity limit is 256. When G257 is added to P, it will enter the `runnext` slot (the clip has a maximum capacity of 256, but one bullet can be chambered. Thus, up to 257).

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_166/  

