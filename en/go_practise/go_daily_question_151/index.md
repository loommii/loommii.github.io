# Go Daily Question 151


What is the output of the following code?

```go
package main

import (
    "fmt"
)

func main() {
    a := []int{2: 1}
    fmt.Println(a)
}
```

- A: Compilation error;
- B: [2 1];
- C: [0 0 1];
- D: [0 1]

{{< details summary="🔑 Answer Analysis:" >}}

C [Run online](https://go.dev/play/p/VMev1IAKxKY)

In Go, slices/arrays can be initialized with indices.

```go
// 1. Elements without keys
slice1 := []int{1, 2, 3}

// 2. Elements with keys (keys are indices)
slice2 := []string{0: "a", 1: "b", 2: "c"}
```

In this problem, it means the element at index 2 is 1, so the slice content is `[0 0 1]`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_151/  

