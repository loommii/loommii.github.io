# Go Daily Question 050


What is the output of the following code?

```go
func main() {  
    s := make(map[string]int)
    delete(s, "h")
    fmt.Println(s["h"])
}
```

A. runtime panic
B. 0
C. compilation error
{{< details summary="🔑 Answer Analysis:" >}}

B 0
Deleting a non-existent key will not cause a panic.
Outputting a non-existent key will return the zero value of its type.

Extension:

```go
func main() {
    var s map[string]int
    delete(s, "h")
    s["h"] = 1
    fmt.Println(s["h"])
}
```

Deleting from a nil map will also not panic.
However, writing to a nil map will panic.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_050/  

