# Go Daily Question 142



What is the output of the following code?

```go
package main

import "fmt"

func main() {
       var s map[string]int
       delete(s, "h")
       fmt.Println(s["h"])
}
```

- A. runtime panic
- B. 0
- C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B
[Run online](https://go.dev/play/p/rfK0pIKBRRx)

- Using `delete` on an uninitialized map (not made with `make`) will not cause an error.
- Accessing an uninitialized map returns the zero value corresponding to the value type.

#### Extension

Assigning to an uninitialized map will cause a panic.

```go
package main

import "fmt"

func main() {
       var s map[string]int
       s["h"] = 1  // panic: assignment to entry in nil map
       fmt.Println(s["h"])
}
```

[Run online](https://go.dev/play/p/MScHCsbM6bt)

> This type of error is an avoidable syntax error. It is recommended to use unit tests to run through the code flow.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_142/  

