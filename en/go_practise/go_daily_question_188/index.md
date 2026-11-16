# Go Daily Question 188


Discuss the process of slice copying.

{{< details summary="🔑 Answer Analysis:" >}}

### Go slices are divided into shallow copy and deep copy

#### Shallow Copy

A Go slice consists of length, capacity, and an underlying array. A shallow copy only duplicates the slice header (slice pointer, length, and capacity).
Since the underlying array of slices is shared, modifying slice elements will affect other slices.

```go
// Shallow copy method 1
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}

    slice2 := slice1 // Shallow copy
    slice2[0] = 4
    fmt.Println(slice1) // [4 2 3]
}
```

#### Deep Copy

```go
// Deep copy method 1
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}
    var slice2 []int = make([]int, len(slice1))
    copy(slice2, slice1)
    slice2[0] = 4
    fmt.Println(slice1)  // [1 2 3]
}
// Deep copy method 2
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}
    var slice2 []int
    slice2 = append(slice2, slice1...)
    slice2[0] = 4
    fmt.Println(slice1)  // [1 2 3]
    fmt.Println(slice2)  // [4 2 3]
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_188/  

