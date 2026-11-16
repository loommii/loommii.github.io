# 2931_Maximum Spending After Buying Items



```go
func maxSpending(values [][]int) int64 {
    
}
```

---

{{< details summary="🧠 Approach: 👈 Click to expand" >}}

Maximizing spending looks like a DP problem at first glance. However, since values[i] is sorted in non-increasing order, let's first consider whether a greedy approach works.

Method 1 - Greedy: only buy the cheapest items first, and buy the expensive ones later.
Create an array to record the tail index of each store (the cheapest item).
Keep finding the minimum and buying it.

Method 2 - Sorting:
There is no need to care about which store we buy from; we only focus on the items.
For example, store A sells an item for 7 yuan, and store B also sells an item for 7 yuan. No matter which store we buy from, the price is the same.
Therefore, we can merge all items together and sort them. Start buying from the cheapest ones.

Method 3 - Sorting Optimization:
Since Go's built-in sort uses insertion sort, and insertion sort has a time complexity of O(n^2), we can switch to a heap, optimizing the time complexity to O(n log n).
{{< /details >}}

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

## Index + Greedy

```go
func maxSpending(values [][]int) (ans int64) {
    m := len(values)
    n := len(values[0])
    indexV := make([]int, m)
    for i, _ := range indexV {
        indexV[i] = n - 1 // tail index
    }
    ruin := 0
    day := 0
    for {
        minV := 1000001
        minI := -1
        day++ // one more day
        for i, v := range indexV {
            // i is the store, v is the index
            if v == -1 {
                ruin++
                continue
            }
            // find the minimum
            if values[i][v] < minV {
                minV = values[i][v]
                minI = i
            }
        }
        if ruin == m { // all items are bought
            break
        } else {
            ruin = 0
        }
        ans += int64(day) * int64(minV)
        indexV[minI]--
    }
    return
}
```

## Sorting

```go
func maxSpending(values [][]int) (ans int64) {
    m, n := len(values), len(values[0])
    valuesList := make([]int, 0, m*n)
    for _, v := range values {
        valuesList = append(valuesList, v...)
    }
    valuesSort := sort.IntSlice(valuesList)
    valuesSort.Sort()
    for i := 0; i < valuesSort.Len(); i++ {
        day := i + 1
        ans += int64(day) * int64(valuesSort[i])
    }
    return
}
```

## Heap Sort

```go
func maxSpending(values [][]int) (ans int64) {
    m, n := len(values), len(values[0])
    idx := make([]int, m)
    for i := range idx {
        idx[i] = i
    }
    h := &hp{idx, values}
    heap.Init(h)

    for d := 1; d <= m*n; d++ {
        a := values[idx[0]]
        ans += int64(a[len(a)-1]) * int64(d)
        if len(a) > 1 {
            values[idx[0]] = a[:len(a)-1]
            heap.Fix(h, 0)
        } else {
            heap.Pop(h)
        }
    }
    return
}

type hp struct {
    sort.IntSlice
    values [][]int
}

func (h hp) Less(i, j int) bool {
    a, b := h.values[h.IntSlice[i]], h.values[h.IntSlice[j]]
    return a[len(a)-1] < b[len(b)-1]
}
func (hp) Push(any) {}
func (h *hp) Pop() (_ any) { a := h.IntSlice; h.IntSlice = a[:len(a)-1]; return }

```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/2931_maximum_spending_after_buying_items/  

