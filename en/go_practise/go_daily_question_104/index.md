# Go Daily Question 104


Is the output of the following code correct?

```go
type Foo struct {
    bar string
}
func main() {
    s1 := []Foo{
        {"A"},
        {"B"},
        {"C"},
    }
    s2 := make([]*Foo, len(s1))
    for i, value := range s1 {
        s2[i] = &value
    }
    fmt.Println(s1[0], s1[1], s1[2])
    fmt.Println(s2[0], s2[1], s2[2])
}
Output:
{A} {B} {C}
&{A} &{B} &{C}
```

{{< details summary="🔑 Answer Analysis:" >}}
After Go 1.22, the output is normal.
Before Go 1.22:
The `for range` loop reuses the `value` variable.
The address of `value` is the same throughout, so the output for `s2` would become CCC.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_104/  

