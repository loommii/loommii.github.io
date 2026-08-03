# Go Daily Question 193


What do the following two code snippets output?

```go
// 1.
func main() {
    s := make([]int, 5)
    s = append(s, 1, 2, 3)
    fmt.Println(s)
}

// 2.
func main() {
    s := make([]int,0)
    s = append(s,1,2,3,4)
    fmt.Println(s)
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
// 1.
[0 0 0 0 0 1 2 3]

// 2.
[1 2 3 4]
```

Reference analysis: This question tests appending elements to a slice using `append`. A common mistake for the first code snippet is expecting `[1 2 3]`; pay attention.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_193/  

