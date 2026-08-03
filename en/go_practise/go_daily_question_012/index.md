# Go Daily Question 012

Will the following code compile? If not, what is the reason? If it compiles, what will be the output?

```go
func main() {
    list := new([]int)
    list = append(list, 1)
    fmt.Println(list)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

It will not compile. After `new([]int)`, `list` is a pointer of type `*[]int`, and you cannot perform an `append` operation on a pointer. You can use `make()` to initialize it first. Similarly, it is recommended to initialize maps and channels using `make()` or literal syntax, and not `new()`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_012/  

