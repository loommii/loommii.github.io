# 2931_购买物品的最大开销



```go
func maxSpending(values [][]int) int64 {
    
}
```

---

{{< details summary="🧠思路:  👈点击" >}}

最大开销，目测是DP问题。但是由于values[i] 按照非递增顺序排序，先考虑能不能用贪心。

方法一贪心：只买最小的，贵的后面买。
创建一个数组记录每个商店的尾下标(最便宜的商品)
不断找最小，然后购买

方法二排序：
不需要关心在那个商店购买，我们只关注商品。
例如商店A 商品7元，商店B 商品7元。在那个商店购买都是一个价。
因此可以将全部商品都合并并排序。从便宜的开始买起

方法三排序优化：
由于Go内置的插入排序,插入排序的时间复杂度为on^2,因此我们可以更换为堆 时间复杂度将可以优化为onlogn
{{< /details >}}

---

{{< details summary="🔑 答案解析： 👈点击" >}}

## 下标+贪心

```go
func maxSpending(values [][]int) (ans int64) {
    m := len(values)
    n := len(values[0])
    indexV := make([]int, m)
    for i, _ := range indexV {
        indexV[i] = n - 1 // 尾下标
    }
    ruin := 0
    day := 0
    for {
        minV := 1000001
        minI := -1
        day++ // 多一天
        for i, v := range indexV {
            // i 是商铺 v是下标
            if v == -1 {
                ruin++
                continue
            }
            // 找最小
            if values[i][v] < minV {
                minV = values[i][v]
                minI = i
            }
        }
        if ruin == m { // 全部买完了
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

## 排序

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

## 堆排序

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/2931_maximum_spending_after_buying_items/  

