# Go Daily Question 061


Two problems at once, because they are related.

1. What is the output of the following code?

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

A: Compilation error; B: [2 1]; C: [0 0 1]; D: [0 1]

2. What is the output of the following code?

```go
package main

func main() {
    var x = []int{4: 44, 55, 66, 1: 77, 88}
    println(len(x), x[2])
}
```

A: 5 66; B: 5 88; C: 7 88; D: None of the above

{{< details summary="🔑 Answer Analysis:" >}}

C C
`a := []int{2: 1}` means the element at index 2 has a value of 1.
Therefore, the initialized slice has `cap 3`, `len 3`, and its content is `0 0 1`. The zero value for `int` is 0.
    `var x = []int{4: 44, 55, 66, 1: 77, 88}`
Let's analyze this step by step:
`4: 44` means the element at index 4 is 44. The `55` that follows has no specified index, so it defaults to the previous index plus 1, similar to `5: 55`. `66` is then `6: 66`.
`1: 77` means the element at index 1 is 77. `88` is then `2: 88`.
Therefore, the initialized slice has `cap 7`, `len 7`, and its content is `0 77 88 0 44 55 66`.
`[0 77 88 0 44 55 66]`
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_061/  

