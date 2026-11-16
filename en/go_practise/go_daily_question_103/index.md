# Go Daily Question 103


What is the output of the following code?

```go
func main() {
    var a = []int{1, 2, 3, 4, 5}
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
r =  [1 12 13 4 5]
a =  [1 12 13 4 5]
`range a` actually operates on a copy of variable `a`. Due to the structure of slices, these two slices will point to the same underlying array. Therefore, changes to `a[1] = 12` and `a[2] = 13` will affect the structure of `v`.

We can verify this by expanding `a` within the loop. In this case, `a` and the copy of the slice will no longer point to the same underlying array, and changes will not affect the copy.

```go
for i, v := range a {
        if i == 0 {
            a = append(a, v)
            a[1] = 12
            a[2] = 13
        }
        r[i] = v
    }
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_103/  

