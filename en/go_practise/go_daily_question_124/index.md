# Go Daily Question 124


What is the output of the following code?

```go
package main

import (
    "encoding/json"
    "fmt"
    "time"
)

func main() {
    t := struct {
        time.Time
        N int
    }{
        time.Date(2020, 12, 20, 0, 0, 0, 0, time.UTC),
        5,
    }

    m, _ := json.Marshal(t)
    fmt.Printf("%s", m)
}
```

A: {"Time": "2020-12-20T00:00:00Z", "N": 5 }; B: "2020-12-20T00:00:00Z"; C: {"N": 5}; D: `<nil>`

{{< details summary="🔑 Answer Analysis:" >}}

Answer: B
In the problem, `time.Time` is embedded in the anonymous struct, which means it inherits `time.Time`.
`time.Time` overrides the `MarshalJSON` method, so it will output according to the format specified by `time.Time`'s `MarshalJSON`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_124/  

