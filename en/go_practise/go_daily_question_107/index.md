# Go Daily Question 107


What is the correct output of the following code?

```go
func main() {
    i := 1
    s := []string{"A", "B", "C"}
    i, s[i-1] = 2, "Z"
    fmt.Printf("s: %v \n", s)
}
```

A. s: [Z,B,C]
B. s: [A,Z,C]

{{< details summary="🔑 Answer Analysis:" >}}
A

Parallel assignment: `a[i], a[j] = a[j], a[i]`

Multiple assignment is divided into two steps, with a specific order:
1. Evaluate the index expressions and address expressions on the left side of the equals sign, and then evaluate the expressions on the right side of the equals sign.
2. Assignment.
Therefore, in this example, `s[i-1]` is calculated first. Since the two expressions on the right side of the equals sign are constants, the assignment operation is equivalent to `i, s[0] = 2, "Z"`.

{{< /details >}}

```

---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_107/  

