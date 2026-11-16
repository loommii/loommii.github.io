# 1287. Element Appearing More Than 25% in Sorted Array



```go
func findSpecialInteger(arr []int) int {

}
```

{{< details summary="👈 Click to expand" >}}

```go
func findSpecialInteger(arr []int) (ans int) {
    n := len(arr) / 4
    f := arr[0]
    i := 0
    for _, v := range arr {
        if v == f {
            i++
            if i > n {
                return v
            }
        } else {
            f = v
            i = 1
        }
    }
    return f
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1287_element_appearing_more_than_25_percent_in_sorted_array/  

