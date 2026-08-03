# Go Daily Question 157


How should A and B in the following code be modified to compile successfully?

```go
func main() {
    var m map[string]int        //A
    m["a"] = 1
    if v := m["b"]; v != nil {  //B
        fmt.Println(v)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

// A
At point A, `map m` is only declared, and no memory space is allocated. Writing to an uninitialized map will cause a panic.

Therefore, `var m map[string]int` needs to be changed to `m := make(map[string]int)`.

// B
When the element with key `b` does not exist, `v` will return the zero value corresponding to its type. Since the type is `int`, `v` will be 0. The comparison `int != nil` will not compile due to type mismatch.

Therefore, `v != nil` needs to be changed to `v != 0`.

```go
package main

import (
    "fmt"
)

func main() {
    m := make(map[string]int) //A
    m["a"] = 1
    if v := m["b"]; v != 0 { //B
        fmt.Println(v)
    }
}
```

[Compile online](https://go.dev/play/p/SqJ3yFfgw4I)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_157/  

