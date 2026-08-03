# 3266_Final Array State After K Multiplication Operations II



{{< details summary="🧠 Ideas: 👈 Click to expand" >}}

This problem is similar to 3264_Final Array State After K Multiplication Operations I, except that the larger amount of data makes finding the minimum by traversal time out, so we need to use a heap.

Since we are looking for the minimum value, we can use a min-heap.

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

### Traversal - Time Limit Exceeded

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

### Min-Heap - Time Limit Exceeded

```go
const mod = 10_0000_0000 + 7

// Define the heap.
type pair struct{ x, i int } // value and index
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // If h[i] < h[j], it builds a min-heap; if h[i] > h[j], it builds a max-heap.
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
    if multiplier == 1 { // The array stays unchanged.
        return nums
    }
    n := len(nums)
    h := make(hp, n)
    for i, v := range nums {
        h[i] = pair{v, i}
    }
    heap.Init(&h)

    for i := 0; i < k; i++ {
        p := heap.Pop(&h) // minimum value
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

### Min-Heap Optimization 1 - Time Limit Exceeded, replace Pop and Push with the Fix operation

```go
const mod = 10_0000_0000 + 7

// Define the heap.
type pair struct{ x, i int } // value and index
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // If h[i] < h[j], it builds a min-heap; if h[i] > h[j], it builds a max-heap.
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
    if multiplier == 1 { // The array stays unchanged.
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3266_final_array_after_k_multiplications_ii/  

