# Go Daily Question 007

Will the following code compile?

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)

    fmt.Println(&m["qcrao"])
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: No, it will cause a compilation error.
>.\main.go:8:15: invalid operation: cannot take address of m["qcrao"] (map index expression of type int)

Analysis:
This question is equivalent to asking: can you directly take the address of a map's element?

Key takeaway: ``You cannot directly take the address of a map's key or value.`` Even if you obtain the address of a key or value through other "hacky" methods, such as `unsafe.Pointer`, you cannot hold it long-term because once the map resizes, the positions of keys and values change, and the previously saved addresses become invalid.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_007/  

