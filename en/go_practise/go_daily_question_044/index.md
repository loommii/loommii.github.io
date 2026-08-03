# Go Daily Question 044


What's wrong with the following code, and how to fix it?

```go
total, sum := 0, 0
for i := 1; i <= 10; i++ {
    sum += i
    go func() {
        total += i
    }()
}
fmt.Printf("total:%d sum %d", total, sum)
```

{{< details summary="🔑 Answer Analysis:" >}}

The value of `sum` is 55.
The value of `total` is between 55 and 100 (inclusive).

Point 1:
Know what the output effect is and how to solve it.
Point 2:
Data race. Because multiple goroutines are writing to the `total` variable simultaneously, there is a data race.
Point 3:
The `main` function exits first, and the launched goroutines do not get a chance to execute.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_044/  

