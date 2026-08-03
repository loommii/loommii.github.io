# Go Daily Question 148


Which of the following options is correct?

```go
package main

import "fmt"

func main() {
    str := "hello"
    str[0] = 'x'
    fmt.Println(str)
}
```

- A. hello
- B. xello
- C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

C
[Run online](https://go.dev/play/p/WKuFSxIZZM8)

[Go Official Documentation - String Types](https://golang.google.cn/ref/spec#String_types)
> Strings are immutable: once created, it is impossible to change the contents of a string.

In the problem, `str` is a string, and its content cannot be changed, so `str[0] = 'x'` will cause an error.

## Extension

### Internal Structure of String

The internal structure of a string in Go is `reflect.StringHeader`, located at [reflect/value.go](https://github.com/golang/go/blob/master/src/reflect/value.go#L2530C1-L2531C1)

```go
type StringHeader struct {
    Data uintptr
    Len  int
}
```

- `Data` is of type `uintptr`, representing a pointer to the string data (byte array).
- `Len` is of type `int`, representing the length of the string.

String literals: their data is stored in the read-only data segment of memory.

In Go, string memory management has certain optimization mechanisms; identical string literals share the underlying array.

```go
package main

import (
    "fmt"
    "unsafe"
)

func main() {
    str1 := "hello"
    str2 := "hello"
    sh1 := unsafe.StringData(str1)
    sh2 := unsafe.StringData(str2)
    fmt.Println("str1 Data:", sh1)
    fmt.Println("str2 Data:", sh2)
    fmt.Println("str1 == str2:", str1 == str2)
    fmt.Println("str1 same data as str2:", sh1 == sh2)

    str3 := "hello" + " world"
    str4 := "hello" + " world"
    sh3 := unsafe.StringData(str3)
    sh4 := unsafe.StringData(str4)

    fmt.Println("str3 Data:", sh3)
    fmt.Println("str4 Data:", sh4)
    fmt.Println("str3 == str4:", str3 == str4)
    fmt.Println("str3 same data as str4:", sh3 == sh4)
}
// str1 Data: 0x4af0e8
// str2 Data: 0x4af0e8
// str1 == str2: true
// str1 same data as str2: true
// str3 Data: 0x4afc26
// str4 Data: 0x4afc26
// str3 == str4: true
// str3 same data as str4: true
```

[Run online](https://go.dev/play/p/FF90LU6QsJk)

This example shows that different string variables use the same `Data`.

Therefore, if changing string content were allowed, modifying the underlying `Data` might affect other strings. To avoid this, Go does not allow it and will cause a `Panic`.

```go
package main

import (
    "fmt"
    "unsafe"
)

func main() {
    str1 := "hello"
    str2 := "hello"
    str1Slice := unsafe.Slice(unsafe.StringData(str1), len(str1))
    str1Slice[0] = 'x'
    fmt.Println(str2)
}
// unexpected fault address 0x4af0e8
// fatal error: fault
// [signal SIGSEGV: segmentation violation code=0x2 addr=0x4af0e8 pc=0x48f21e]
```

[Run online](https://go.dev/play/p/nzSHK4l6kDl)

This is different from the error in this problem: one is a compilation error, and the other is a runtime panic.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_148/  

