# Go Daily Question 152


What is the output of the following code?

```go
package main

func main() {
    var x = []int{4: 44, 55, 66, 1: 77, 88}
    println(len(x), x[2])
}
```

- A: 5 66
- B: 5 88
- C: 7 88
- D: None of the above

{{< details summary="🔑 Answer Analysis:" >}}

C [Run online](https://go.dev/play/p/0TLiSY6YQ9y)

In Go, slices/arrays can be initialized with indices.

```go
// 1. Elements without keys
slice1 := []int{1, 2, 3}

// 2. Elements with keys (keys are indices)
slice2 := []string{0: "a", 1: "b", 2: "c"}
```

This problem uses a mixed initialization method with explicit and implicit indices.

#### Analysis of the initialization process for `[]int{4: 44, 55, 66, 1: 77, 88}`

1.  `4: 44`: Explicitly specifies the value at index 4 as 44.
    `[0, 0, 0, 0, 44]`
2.  `55` and `66`: No index specified, so they are placed sequentially starting from the last specified index.
    `[0, 0, 0, 0, 44, 55, 66]`
3.  `1: 77`: Explicitly specifies the value at index 1 as 77.
    `[0, 77, 0, 0, 44, 55, 66]`
4.  `88`: No index specified, so it is placed sequentially starting from the last specified index.
    `[0, 77, 88, 0, 44, 55, 66]`

Therefore, the content of `x` is `[0, 77, 88, 0, 44, 55, 66]`.
This problem asks for `(len(x), x[2])`, which gives the output result as answer C: `7 88`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_152/  

