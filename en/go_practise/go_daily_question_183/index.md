# Go Daily Question 183


What is the correct output of the following code?

```go
package main

import "fmt"

func main() {
    i := 1
    s := []string{"A", "B", "C"}
    i, s[i-1] = 2, "Z"
    fmt.Printf("s: %v \n", s)
}
```

- A. s: [Z,B,C]
- B. s: [A,Z,C]

{{< details summary="🔑 Answer Analysis:" >}}

### Answer: A

[Go Online Run](https://go.dev/play/p/cLui57mACBf)

### Key Takeaway: Multiple Assignment

Multiple assignment is divided into two steps, with a strict order:

1.  Calculation Phase: First, the index expressions and address expressions on the left side of the equals sign are evaluated, and then all expressions on the right side of the equals sign are evaluated. Note that it's *left first, then right*, but *left-side internals are evaluated from left to right*.
2.  Assignment Phase: The calculated values of the right-side expressions are assigned to the corresponding variables on the left side, from left to right.

### Key Points

- In the calculation phase, the left-side indices are calculated first. If an index involves a variable, the value of that variable at that moment is used for the index calculation.
- The assignment phase proceeds from left to right.

### Analysis of this Example

In this example, `s[i-1]` will be calculated first. At this point, the value of `i` is 1, so `s[0]` is calculated. The two expressions on the right side of the equals sign are constants, and their calculated results are 2 and "Z" respectively. Then the assignment is performed, so the assignment operation is equivalent to `i, s[0] = 2, "Z"`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_183/  

