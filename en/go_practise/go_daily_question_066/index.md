# Go Daily Question 066


How should A and B in the following code be modified to compile successfully?

```go
func main() {
    var m map[string]int        //A
    m["a"] = 1
    if v := m["b"]; v != nil {  //B
        fmt.Println(v)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```go
func main() {
    m := make(map[string]int)
    m["a"] = 1
    if v,ok := m["b"]; ok {
        fmt.Println(v)
    }
}
```

At point A, `map m` is only declared, but no memory space is allocated. It cannot be directly assigned. `make()` needs to be used. It is generally recommended to initialize maps directly using `make()` or a literal.

At point B, `v, k := m["b"]`. When the element with key `b` does not exist, `v` will return the zero value corresponding to its type, and `k` will return `false`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_066/  

