# Go Daily Question 041


What is the output of the following code?

```go
func hello(num ...int) {  
    num[0] = 18
}

func main() {  
    i := []int{5, 6, 7}
    hello(i...)
    fmt.Println(i[0])
}
```

A.18
B.5
C.Compilation error
{{< details summary="🔑 Answer Analysis:" >}}

Answer: A 18
Analysis: `...` essentially passes a slice. Since no slice expansion occurred, both slices refer to the same underlying array. Therefore, `i[0]` is changed to 18.

Here's a small modification to the original problem:

```go
package main

import "fmt"

func hello(num ...int) {
    num = append(num, 1)
    num[0] = 18

}
func main() {
    i := []int{5, 6, 7}
    hello(i...)
    fmt.Println(i[0])
}
```

After the modification, the `num` slice undergoes expansion, causing the two slices to refer to different underlying arrays. Therefore, it will not affect the `i` slice, and the final output will be 5.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_041/  

