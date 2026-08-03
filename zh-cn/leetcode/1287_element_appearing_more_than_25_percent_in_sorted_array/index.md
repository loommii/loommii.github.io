# 1287. 有序数组中出现次数超过25%的元素



```go
func findSpecialInteger(arr []int) int {

}
```

{{< details summary="👈点击" >}}

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1287_element_appearing_more_than_25_percent_in_sorted_array/  

