# 3266_K_次乘运算后的最终数组_II



{{< details summary="🧠思路:  👈点击" >}}

与3264_K_次乘运算后的最终数组_I题目类似，只是增加了数据量导致通过遍历查找最小数会超时，因此需要使用堆的方式
我们寻找的是最小值,因此可以使用最小堆

{{< /details >}}

---

{{< details summary="🔑 答案解析： 👈点击" >}}

### 遍历-超时

```go
func getFinalState(nums []int, k int, multiplier int) []int {
    n := len(nums)
    for i := 0; i < k; i++ {
        minI := 0
        for j := 1; j < n; j++ {
            if nums[j] < nums[minI] {
                minI = j
            }
        }
        nums[minI] *= multiplier
    }
    mod := 1000000000 + 7
    for i := 0; i < n; i++ {
        nums[i] = nums[i] % mod
    }
    return nums
}

```

### 小顶堆-超时

```go
const mod = 10_0000_0000 + 7

// 定义一下heap
type pair struct{ x, i int } // 值 和 下标
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // 如果h[i]<h[j]生成的就是小根堆，如果h[i]>h[j]生成的就是大根堆
    if h[i].x < h[j].x || h[i].x == h[j].x && h[i].i < h[j].i {
        return true
    }
    return false
}
func (h hp) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *hp) Push(x any) {
    *h = append(*h, x.(pair))
}
func (h *hp) Pop() any {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
func getFinalState(nums []int, k int, multiplier int) []int {
    if multiplier == 1 { // 数组不变
        return nums
    }
    n := len(nums)
    h := make(hp, n)
    for i, v := range nums {
        h[i] = pair{v, i}
    }
    heap.Init(&h)

    for i := 0; i < k; i++ {
        p := heap.Pop(&h) // 最小值
        pp := p.(pair)
        pp.x = pp.x % mod * multiplier % mod
        nums[pp.i] = pp.x
        heap.Push(&h, pp)
    }

    for i := 0; i < n; i++ {
        nums[i] = nums[i] % mod
    }
    return nums
}
```

### 小顶堆优化1-超时,将出堆和入队改为FIX操作

```go
const mod = 10_0000_0000 + 7

// 定义一下heap
type pair struct{ x, i int } // 值 和 下标
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // 如果h[i]<h[j]生成的就是小根堆，如果h[i]>h[j]生成的就是大根堆
    if h[i].x < h[j].x || h[i].x == h[j].x && h[i].i < h[j].i {
        return true
    }
    return false
}
func (h hp) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *hp) Push(x any) {
    *h = append(*h, x.(pair))
}
func (h *hp) Pop() any {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}
func getFinalState(nums []int, k int, multiplier int) []int {
    if multiplier == 1 { // 数组不变
        return nums
    }
    n := len(nums)
    h := make(hp, n)
    for i, v := range nums {
        h[i] = pair{v, i}
    }
    heap.Init(&h)

    for i := 0; i < k; i++ {
        pp := &h[0]
        pp.x = pp.x % mod * multiplier % mod
        nums[pp.i] = pp.x
        heap.Fix(&h, 0)
    }

    for i := 0; i < n; i++ {
        nums[i] = nums[i] % mod
    }
    return nums
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3266_final_array_after_k_multiplications_ii/  

