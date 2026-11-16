# 1338_数组大小减半



{{< details summary="🧠思路:  👈点击" >}}

### 猜想

贪心的想法，先遍历一遍记录出现次数。从频率最高的开始删除
问题就变为了怎么记录次数后从大到小排序方便

{{< /details >}}

---

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
type pair struct{ x, c int } // 值 和 次数
type hp []pair

func (h hp) Len() int { return len(h) }
func (h hp) Less(i, j int) bool {
    // 如果h[i]<h[j]生成的就是小根堆，如果h[i]>h[j]生成的就是大根堆

    return h[i].c > h[j].c // 大顶堆
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
    heap.Init(&h) // 堆初始化
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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1338_reduce_array_size_to_the_half/  

