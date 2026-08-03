# Go Daily Question 024


Will the following code compile? If so, what will be the output?

```go
package main

import "fmt"

type MyInt1 int
type MyInt2 = int

func main() {
    var i int =0
    var i1 MyInt1 = i 
    var i2 MyInt2 = i
    fmt.Println(i1,i2)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: No.
Reference analysis: This question tests the difference between type aliases and type definitions.
Type alias: `` type MyInt2 = int ``
Type definition: `` type MyInt1 int ``
In Go, the types on both sides of the assignment operator `=` must be consistent.
`MyInt1` is a new type defined based on `int`, so it cannot be directly assigned. If an assignment is needed, type conversion is required: ``var i1 MyInt1 = MyInt1(i)``
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_024/  

