# Go Daily Question 172


How many syntax issues are there in the following code, and what are they?

```go
package main
import (
    "fmt"
)
func main() {
    var x string = nil
    if x == nil {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
./prog.go:8:17: cannot use nil as string value in variable declaration
./prog.go:9:10: invalid operation: x == nil (mismatched types string and untyped nil)
```

### `var x string = nil` Error

In Go, the zero value for a `string` type is an empty string `""`, not `nil`. `nil` is typically used for types like pointers, slices, maps, channels, and interfaces. Therefore, assigning `nil` to a `string` type variable `x` will result in a compilation error.

The correct way to write it would be: `var x string` or `var x string = ""`.

### `if x == nil` Error

Since `x` is of `string` type, it cannot be compared with `nil`. A `string` type variable should be compared with an empty string `""`.

The correct way to write it would be: `if x == ""`.

```go
ackage main

import (
    "fmt"
)

func main() {
    var x string = "" // Or simply var x string
    if x == "" {
        x = "default"
    }
    fmt.Println(x)
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_172/  

