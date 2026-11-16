# Go Daily Question 156


What are the length and capacity of slices a, b, and c respectively?

```go
package main

import (
    "fmt"
)

func main() {
    s := [3]int{1, 2, 3}
    a := s[:0]
    b := s[:2]
    c := s[1:2:cap(s)]

    fmt.Println(len(a), cap(a))
    fmt.Println(len(b), cap(b))
    fmt.Println(len(c), cap(c))
}
```

{{< details summary="🔑 Answer Analysis:" >}}

a: Length and capacity 0 3
b: Length and capacity 2 3
c: Length and capacity 1 2

[Run online](https://go.dev/play/p/QHiuY9qh4pw)

### Key Takeaway: Array or Slice Slicing Operations

Slicing operations can have 2 or 3 parameters, such as `[i:j]` and `[i:j:k]`.

## 1. `[i:j]` Form

`[i:j]` is the most common form of slice slicing, indicating a slice starting from the `i`-th element of the underlying array and ending before the `j`-th element (exclusive).

- **Syntax**: `s[i:j]`
- **Meaning**:
  - `i`: Starting index of the slice (inclusive).
  - `j`: Ending index of the slice (exclusive).
- **Length**: `j - i`
- **Capacity**: From index `i` to the end of the underlying array.
  - If the length of the underlying array is `n`, the capacity is `n - i`.

### Example

```go
s := [3]int{1, 2, 3}
b := s[:2] // Starts from index 0, ends before index 2 (exclusive), left-closed, right-open.
fmt.Println(a)       // Output: [1 2]
fmt.Println(len(a))  // Output: 2 (Length) 2-0
fmt.Println(cap(a))  // Output: 3 (Capacity, because the underlying array length is 3, starting from index 0) 3-0
```

## 2. `[i:j:k]` Form

`[i:j:k]` is a more flexible form of slice slicing. In addition to specifying the start and end indices of the slice, it can also explicitly specify the capacity of the slice.

- **Syntax**: `s[i:j:k]`
- **Meaning**:
  - `i`: Starting index of the slice (inclusive).
  - `j`: Ending index of the slice (exclusive).
  - `k`: Capacity cutoff index of the slice (exclusive).
- **Length**: `j - i`
- **Capacity**: `k - i`
  - The capacity cannot exceed the length of the underlying array; otherwise, it will cause a runtime error.

### Example

```go
s := [3]int{1, 2, 3}
c := s[1:2:cap(s)] // Starts from index 1, ends before index 2 (exclusive), capacity extends to index 3
fmt.Println(c)       // Output: [2]
fmt.Println(len(c))  // Output: 1 (Length, 2 - 1 = 1)
fmt.Println(cap(c))  // Output: 2 (Capacity, 3 - 1 = 2)
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_156/  

