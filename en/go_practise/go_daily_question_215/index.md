# Go Daily Question 215


Which option can be filled in the blank in the following code?
```go
package main

import "fmt"

func main() {
	var s1 []int
	var s2 = []int{}
	if __ == nil {
		fmt.Println("yes nil")
	} else {
		fmt.Println("no nil")
	}
}
```

- A. s1
- B. s2
- C. Both s1 and s2

{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis: A.

Key takeaways: nil slices and empty slices. A nil slice is equal to nil and generally represents a non-existent slice; an empty slice is not equal to nil and represents an empty collection.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_215/  

