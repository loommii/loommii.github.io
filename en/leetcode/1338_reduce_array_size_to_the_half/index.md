# 1338_Reduce Array Size to the Half



{{< details summary="🧠 Approach: 👈 Click to expand" >}}

### Intuition

A greedy idea: first traverse the array once to record the occurrence counts. Then start deleting from the highest frequency.
The problem then becomes how to record the counts and sort them in descending order conveniently.

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
type pair struct{ x, c int } // value and count
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // If h[i] < h[j], this generates a min-heap; if h[i] > h[j], it generates a max-heap.

    return h[i].c > h[j].c // max-heap
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

func minSetSize(arr []int) int {
    n := len(arr)
    CountMap := make(map[int]int)
    for _, v := range arr {
        CountMap[v]++
    }
    var h hp = make(hp, 0, len(CountMap))
    for x, c := range CountMap {
        h = append(h, pair{x, c})
    }
    heap.Init(&h) // heap initialization
    ans := 0
    for i := 0; i < n/2; {
        p := heap.Pop(&h).(pair)
        ans++
        i += p.c
    }
    return ans
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1338_reduce_array_size_to_the_half/  

