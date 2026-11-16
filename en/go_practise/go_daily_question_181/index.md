# Go Daily Question 181


What is the output value of `counter` in the following code?

```go
package main

import "fmt"

func main() {
    var m = map[string]int{
        "A": 21,
        "B": 22,
        "C": 23,
    }
    counter := 0
    for k, v := range m {
        if counter == 0 {
            delete(m, "A")
        }
        counter++
        fmt.Println(k, v)
    }
    fmt.Println("counter is ", counter)
}
```

- A. 2
- B. 3
- C. 2 or 3

{{< details summary="🔑 Answer Analysis:" >}}

C
[Go Online Run](https://go.dev/play/p/-OKOFSeE6GS)
The iteration order of `for range map` is unordered. If `A` is encountered in the first iteration, the output is 3; otherwise, it is 2.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_181/  

