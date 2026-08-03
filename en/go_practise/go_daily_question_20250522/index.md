# Go Daily Question 20250522


What is the output of the following code?

```go
func main() {
    a := 1
    b := 2
    defer calc("1", a, calc("10", a, b))
    a = 0
    defer calc("2", a, calc("20", a, b))
    b = 1
}

func calc(index string, a, b int) int {
    ret := a + b
    fmt.Println(index, a, b, ret)
    return ret
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
10 1 2 3
20 0 2 2
2 0 2 2
1 1 3 4
```

When the program executes to the third line of the `main()` function, it first executes the `b` parameter of the `calc()` function, i.e., `calc("10", a, b)`, which outputs: `10 1 2 3` and gets the value 3. Because the function defined by `defer` is a deferred function, `calc("1", 1, 3)` will be executed later.

When the program executes to the fifth line, it similarly first executes `calc("20", a, b)`, outputting: `20 0 2 2` and getting the value 2. Likewise, `calc("2", 0, 2)` is deferred.

When the program reaches the end, it executes `calc("2", 0, 2)` and `calc("1", 1, 3)` in a Last-In, First-Out (LIFO) manner, resulting in the sequential output: `2 0 2 2`, `1 1 3 4`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250522/  

