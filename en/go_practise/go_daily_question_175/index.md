# Go Daily Question 175


What is the output of the following code?

```go
package main

import "fmt"

const (
    a = iota
    b = iota
)
const (
    name = "name"
    c    = iota
    d    = iota
)

func main() {
    fmt.Println(a)
    fmt.Println(b)
    fmt.Println(c)
    fmt.Println(d)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
0
1
1
2
```

[Run online](https://go.dev/play/p/3owhzDo5QeG)

**Code Analysis:**

### First `const` block

- `a = iota`: `iota` starts counting from `0` in a `const` block, so `a = 0`.
- `b = iota`: `iota` increments to `1`, so `b = 1`.

### Second `const` block

- `name = "name"`: `iota` is not used, but `iota`'s initial value is `0`, and it increments to `1` after declaration.
- `c = iota`: The current `iota` value is `1`, so `c = 1`.
- `d = iota`: `iota` continues to increment to `2`, so `d = 2`.

### Key Rules

- `iota` starts counting from `0` in each `const` block.
- Each line of constant declaration (whether `iota` is used or not) increments `iota` by `1`.
- `iota` in different `const` blocks are independent of each other.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_175/  

