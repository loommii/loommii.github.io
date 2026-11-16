# Go Daily Question 086


What is the output of the following code?

```go
func main() {
    m := map[int]string{0:"zero",1:"one"}
    for k,v := range m {
        fmt.Println(k,v)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```
0 zero
1 one
// Or
1 one
0 zero
```

The output of a map is unordered.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_086/  

