# Go Daily Question 058


What is the output of the following code?

```go
func incr(p *int) int {
    *p++
    return *p
}

func main() {
    p :=1
    incr(&p)
    fmt.Println(p)
}
```

- A. 1
- B. 2
- C. 3

{{< details summary="🔑 Answer Analysis:" >}}

Answer: B.

Key takeaway: Pointers. `p` in the `incr()` function is a pointer of type `*int`, pointing to the address of the variable `p` in the `main()` function. The second line of code performs an increment operation on the value at that address. `incr()` returns the result after the increment.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_058/  

