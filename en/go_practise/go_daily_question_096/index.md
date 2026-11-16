# Go Daily Question 096


What's wrong with the following code?

```go
func main() {
    fmt.Println([...]int{1} == [2]int{1})
    fmt.Println([]int{1} == []int{1})
}
```

{{< details summary="🔑 Answer Analysis:" >}}

There are two errors:

In Go, different types cannot be compared. The length of an array is part of its type, so `[...]int{1}` and `[2]int{1}` are two different types and cannot be compared.
Slices cannot be compared.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_096/  

