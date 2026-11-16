# Go Daily Question 213


What is the output of the following code?

```go
package main

import (  
    "fmt"
)

func main() {  
    a := [5]int{1, 2, 3, 4, 5}
    t := a[3:4:4]
    fmt.Println(t[0])
}
```
- A.3
- B.4
- C.compilation error

{{< details summary="🔑 Answer Analysis:" >}}

B
[Run online](https://go.dev/play/p/z3KqBXFXMm3)

**Answer:** B

**Key takeaway:** Go Language Slice Operator `[i:j:k]`

**Analysis:**

1.  **Array Initialization:**
    `a := [5]int{1, 2, 3, 4, 5}` creates an array `a` containing 5 integers. Its content is `[1, 2, 3, 4, 5]`, with indices from 0 to 4.

2.  **Slice Operation `a[i:j:k]`:**
    Go allows creating new slices from arrays or slices using three indices: `slice := source[i:j:k]`.
    *   `i`: Starting index (inclusive). The new slice starts from the `i`-th element of `source`.
    *   `j`: Ending index (exclusive). The new slice includes elements up to the `j-1`-th element of `source`.
    *   `k`: Capacity limit index. The capacity of the new slice is set to `k - i`. This limits the range of the underlying array that the new slice can access. The value of `k` cannot exceed the capacity of `source` (for an array, its length).
    *   The **length** of the new slice is calculated as `j - i`.
    *   The **capacity** of the new slice is calculated as `k - i`.

3.  **Analysis of `t := a[3:4:4]`:**
    *   `source` is the array `a` (`[1, 2, 3, 4, 5]`).
    *   `i = 3`: Starting index is 3, corresponding value is `a[3] = 4`.
    *   `j = 4`: Ending index is 4. The slice includes elements from index 3 up to, but not including, index 4, which means it only includes the element at index 3, which is `4`.
    *   `k = 4`: Capacity limit index is 4.
    *   Calculate `t`'s **length**: `length = j - i = 4 - 3 = 1`.
    *   Calculate `t`'s **capacity**: `capacity = k - i = 4 - 3 = 1`.
    *   Therefore, `t` is a newly created slice with a length of 1 and a capacity of 1. It contains the element at index 3 of the original array `a`. So the content of `t` is `[4]`.

4.  **Output:**
    The `fmt.Println(t[0])` statement tries to print the element at index 0 of slice `t`. Since `t` is `[4]`, the value of `t[0]` is `4`.

**Conclusion:** The code will output `4`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_213/  

