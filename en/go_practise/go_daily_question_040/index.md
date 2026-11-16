# Go Daily Question 040


What is the output of the following code?

```go
type person struct {  
    name string
}

func main() {  
    var m map[person]int
    p := person{"mike"}
    fmt.Println(m[p])
}
```

A.0
B.1
C.Compilation error
{{< details summary="🔑 Answer Analysis:" >}}
Answer: A 0

`m` is a map, and its value is `nil`. Getting a value from a `nil` map will not cause an error; instead, it returns the corresponding zero value. Here, the value is of type `int`, so it returns 0.

Note: A `nil` map can be read from, but not written to. Writing to a `nil` map will cause a panic.

```go
package main

import "fmt"

type person struct {
    name string
}

func main() {
    var m map[person]int
    p := person{"mike"}
    m[p] = 2
    fmt.Println(m[p])
} 
```

Output: `panic: assignment to entry in nil map`

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_040/  

