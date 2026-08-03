# 1299. Replace Elements With Greatest Element on Right Side



```go
func replaceElements(arr []int) []int {

}
```

{{< details summary="👉 Solution:" >}}

```go
func replaceElements(arr []int) []int {
    n := len(arr)
    maxNum := -1
    for i := n - 1; i >= 0; i-- {
        arr[i], maxNum = maxNum, max(maxNum, arr[i])
    }
    return arr
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1299_replace_elements_with_greatest_element_on_right_side/  

