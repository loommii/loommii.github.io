# 1387_将整数按权重排序



```go
func getKth(lo int, hi int, k int) int {
    
}
```

{{< details summary="🔑 答案解析： 👈点击" >}}

```go

type num struct {
    data   int
    weight int
}
type nlist []num

// 设置权重
func (n *num) SetWeight() {
    for i := n.data; i != 1; n.weight++ {
        if i%2 == 0 {
            i = i / 2
        } else {
            i = 3*i + 1
        }
    }
}
func (n nlist) Len() int {
    return len(n)
}
func (n nlist) Less(i, j int) bool {
    if n[i].weight > n[j].weight || (n[i].weight == n[j].weight && n[i].data > n[j].data) {
        return false
    }
    return true
}
func (n nlist) Swap(i, j int) {
    n[i], n[j] = n[j], n[i]
}
func getKth(lo int, hi int, k int) (ans int) {

    nums := make(nlist, hi-lo+1)
    // 记录走了多少步
    for i := range nums {
        nums[i].data = i + lo
        nums[i].SetWeight()
    }
    // 排序
    sort.Sort(nums)
    return nums[k-1].data
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1387_sort_integers_by_the_power_value/  

