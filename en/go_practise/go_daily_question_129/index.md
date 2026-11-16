# Go Daily Question 129


What happens when the following code is executed?

```go
package main

import (
    "fmt"
    "time"
)

func main() {
    ch := make(chan int, 1000)
    go func() {
        for i := 0; i < 10; i++ {
            ch <- i
        }
    }()
    go func() {
        for {
            a, ok := <-ch
            if !ok {
                fmt.Println("close")
                return
            }
            fmt.Println("a: ", a)
        }
    }()
    close(ch)
    fmt.Println("ok")
    time.Sleep(time.Second * 100)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
ok
close
panic: send on closed channel

goroutine 6 [running]:
```

Writing data to a closed channel will cause a panic.
Reading data from a closed channel, when there's no buffered data, will read the zero value.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_129/  

