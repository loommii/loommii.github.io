# Go Daily Question 20250521


What is the output of the following code?
```go
package main

import (
	"fmt"
)

func main() {
	m := map[int]string{0: "zero", 1: "one"}
	for k, v := range m {
		fmt.Println(k, v)
	}
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer Analysis:
Reference Answer and Analysis:
```
0 zero
1 one
// Or
1 one
0 zero
```

[Run online](https://go.dev/play/p/9oYfWSMuJBr)

The output of a map is unordered.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250521/  

