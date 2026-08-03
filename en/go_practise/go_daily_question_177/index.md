# Go Daily Question 177


What is the output of the following code?

```go
package main

import "fmt"

func main() {
       var a = [5]int{1, 2, 3, 4, 5}
       var r [5]int

       for i, v := range a {
              if i == 0 {
                     a[1] = 12
                     a[2] = 13
              }
              r[i] = v
       }
       fmt.Println("r = ", r)
       fmt.Println("a = ", a)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
r =  [1 2 3 4 5]
a =  [1 12 13 4 5]
```

[Go Online Run](https://go.dev/play/p/rUJZHJQLR1b)

Array `range` behavior: When using `range` to iterate over an array, Go first creates a copy of the original array, and the iteration is performed on this copy. Therefore, modifications to the original array within the loop will not affect the values during iteration.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_177/  

