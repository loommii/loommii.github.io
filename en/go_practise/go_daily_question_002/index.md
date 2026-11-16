# Go Daily Question 002

What is the output of the following code?

```go
package main

import (
    "fmt"
)

func main() {
    defer_call()
}

func defer_call() {
    defer func() { fmt.Println("before print") }()
    defer func() { fmt.Println("during print") }()
    defer func() { fmt.Println("after print") }()

    panic("trigger panic")
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```text
after print
during print
before print
panic: trigger panic
```

Analysis: The execution order of defer is Last-In, First-Out (LIFO). When a panic statement occurs, defer functions are executed in LIFO order, and finally the panic is executed.

Key takeaway: ``defer LIFO``

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_002/  

