# Go Daily Question 008


How to check if two maps are equal?

{{< details summary="🔑 Answer Analysis:" >}}

Conditions for deep equality of maps:

Both are nil
Non-empty, equal length, pointing to the same map entity object
Corresponding keys point to "deeply" equal values

Directly using `map1 == map2` is `incorrect`. This syntax can only compare if a map is nil.

```go
package main

import "fmt"

func main() {
    var m map[string]int
    var n map[string]int

    fmt.Println(m == nil)
    fmt.Println(n == nil)

    // Does not compile
    //fmt.Println(m == n)
}
```

Solution 1: Iteration (more cumbersome)
Iterate through each element of the map and compare if all elements are deeply equal.
Solution 2: Reflection

```go
package main

import( 
    "fmt"
    "reflect"
)
func main() {
    var m map[string]int
    var n map[string]int

    fmt.Println(reflect.DeepEqual(m,n))
}
```

References:

- 🔗:[reflect.DeepEqual function: judging whether two values are consistent](https://blog.csdn.net/m0_37710023/article/details/108284171)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_008/  

