# Go Daily Question 101


What is the output of the following code?

```go
func main() {
    var a = [5]int{1, 2, 3, 4, 5}
    var r [5]int

    for i, v := range a {
        if i == 0 {
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
    fmt.Println("r = ", r)
    fmt.Println("a = ", a)
}
```

{{< details summary="🔑 Answer Analysis:" >}}
r =  [1 2 3 4 5]
a =  [1 12 13 4 5]
The range expression participates in the loop with a copy, meaning that in the example, a copy of `a` is used in the loop, not the actual `a`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_101/  

