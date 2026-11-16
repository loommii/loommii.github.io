# Go Daily Question 178


What is the output of the following code?

```go
package main

import "fmt"

func change(s ...int) {
    s = append(s, 3)
}

func main() {
    slice := make([]int, 5, 5)
    slice[0] = 1
    slice[1] = 2
    change(slice...)
    fmt.Println(slice)
    change(slice[0:2]...)
    fmt.Println(slice)
}

```

{{< details summary="🔑 Answer Analysis:" >}}

```go
[1 2 0 0 0]
[1 2 3 0 0]
```

[Go Online Run](https://go.dev/play/p/sJ68ZpNd2Tj)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_178/  

