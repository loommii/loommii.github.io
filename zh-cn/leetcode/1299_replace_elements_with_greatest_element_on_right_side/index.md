# 1299. 将每个元素替换为右侧最大元素



```go
func replaceElements(arr []int) []int {

}
```

{{< details summary="👉 解答：" >}}

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1299_replace_elements_with_greatest_element_on_right_side/  

