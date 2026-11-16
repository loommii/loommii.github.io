# Go Daily Question 153


Which option can be filled in the blank at `填空`? And describe the result of running after filling in.

```go
package main

import "fmt"

func main() {
       var s1 []int
       var s2 = []int{}
       _, _ = s1, s2
       if /* blank */ == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }
}
```

- A. s1
- B. s2
- C. Both s1 and s2
- D. None of the above

{{< details summary="🔑 Answer Analysis:" >}}

C [Run online](https://go.dev/play/p/9yTgpE0eMFE)

```go
package main

import "fmt"

func main() {
       var s1 []int
       var s2 = []int{}
       _, _ = s1, s2
       if s1 == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }

       if s2 == nil {
              fmt.Println("yes nil")
       } else {
              fmt.Println("no nil")
       }
}
//yes nil
//no nil
```

## Slice `nil` vs. Empty Slice

In the [Go documentation - Slice types](https://golang.google.cn/ref/spec#Slice_types), there is a description:

> **The value of an uninitialized slice is nil.**

Based on this description, we can draw the following conclusions:

## 1. Case for filling in `s1`

- `s1` is declared with `var s1 []int`, which is an uninitialized slice, and its value is `nil`.
- Therefore, the program will enter the `"yes nil"` branch.

## 2. Case for filling in `s2`

- `s2` is declared with `var s2 = []int{}`, which is an initialized empty slice.
- Although its length is 0, it is not `nil`; it points to an underlying array (even if the array's space is 0).
- Therefore, the program will enter the `"no nil"` branch.

---

## Code Verification

The following [code](https://go.dev/play/p/7RnFOI6Eade) verifies the underlying data pointers of `s1` and `s2`:

```go
package main

import (
       "fmt"
       "unsafe"
)

func main() {
       var s1 []int
       var s2 = []int{}

       fmt.Println("s1 underlying Data value is", unsafe.SliceData(s1)) // <nil>
       fmt.Println("s2 underlying Data value is", unsafe.SliceData(s2)) // 0x572380 (specific address may vary)
}
```

### Supplement

Slices cannot be directly compared using `==` or `!=`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_153/  

