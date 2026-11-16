# Go Daily Question 20250528


What is the output of the following code?

```go
package main

import (
	"fmt"
)

type Direction int

const (
	North Direction = iota
	East
	South
	West
)

func (d Direction) String() string {
	return [...]string{"North", "East", "South", "West"}[d]
}

func main() {
	fmt.Println(South)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Reference answer and explanation: "South". Key takeaways: usage of iota, and a type's String() method.

Based on the usage of `iota`, the value of `South` is inferred to be 2. Additionally, if a type defines a `String()` method, `fmt.Printf()`, `fmt.Print()`, and `fmt.Println()` will automatically use the `String()` method to print the string representation.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250528/  

