# Go Daily Question 174


What is the output of the following code? Why?

```go
package main

import (
    "fmt"
)

func main() {
    s1 := []int{1, 2, 3}
    s2 := s1[1:]
    s2[1] = 4
    fmt.Println(s1)
    s2 = append(s2, 5, 6, 7)
    fmt.Println(s2)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
[1 2 4]
[2 4 5 6 7]
```

[Run online](https://go.dev/play/p/XL6Vb0mzsEs)

## Slices Sharing Underlying Arrays

- `s1` is initialized as `[]int{1, 2, 3}`, its underlying array is `[1, 2, 3]`, and both its length and capacity are 3.
- `s2 := s1[1:]` creates a sub-slice of `s1`. At this point:
  - `s2` shares the same underlying array as `s1`.
  - `s2` starts at index 1, has a length of 2 (elements `[2, 3]`), and a capacity of 2 (original slice capacity 3 - starting index 1 = 2).

## Modifying Shared Elements

- `s2[1] = 4` modifies the third element of the underlying array (index 2). Since `s1` and `s2` share the underlying array, `s1` becomes `[1, 2, 4]`.

## `append` Triggers Reallocation

- When `s2 = append(s2, 5, 6, 7)`, the original capacity of 2 is not enough to hold 5 elements (original length 2 + 3 new elements), triggering reallocation.
- After reallocation, `s2`'s underlying array becomes a completely new array, entirely independent of the original `s1`.
- The elements of the new `s2` are `[2, 4, 5, 6, 7]`, and `s1` remains unaffected.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_174/  

