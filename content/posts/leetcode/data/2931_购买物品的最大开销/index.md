---
date: '2024-12-12T13:58:44+08:00'
draft: false
title: '2931_购买物品的最大开销'
---
力扣链接:[2931. 购买物品的最大开销](https://leetcode.cn/problems/maximum-spending-after-buying-items/description/?envType=daily-question&envId=2024-12-12)

力扣难度 `困难`
算法评级: 6
难度分 1822

---
题目:

给你一个下标从 0 开始大小为 m *n 的整数矩阵 values ，表示 m 个不同商店里 m* n 件不同的物品。每个商店有 n 件物品，第 i 个商店的第 j 件物品的价值为 values[i][j] 。除此以外，第 i 个商店的物品已经按照价值非递增排好序了，也就是说对于所有 0 <= j < n - 1 都有 values[i][j] >= values[i][j + 1] 。

每一天，你可以在一个商店里购买一件物品。具体来说，在第 d 天，你可以：

- 选择商店 i 。
- 购买数组中最右边的物品 j ，开销为 values[i][j] *d 。换句话说，选择该商店中还没购买过的物品中最大的下标 j ，并且花费 values[i][j]* d 去购买。

注意，所有物品都视为不同的物品。比方说如果你已经从商店 1 购买了物品 0 ，你还可以在别的商店里购买其他商店的物品 0 。

请你返回购买所有 m * n 件物品需要的 最大开销 。

---
示例 1：
>输入：values = [[8,5,2],[6,4,1],[9,7,3]]
输出：285
解释：第一天，从商店 1 购买物品 2 ，开销为 values[1][2] *1 = 1 。
第二天，从商店 0 购买物品 2 ，开销为 values[0][2]* 2 = 4 。
第三天，从商店 2 购买物品 2 ，开销为 values[2][2] *3 = 9 。
第四天，从商店 1 购买物品 1 ，开销为 values[1][1]* 4 = 16 。
第五天，从商店 0 购买物品 1 ，开销为 values[0][1] *5 = 25 。
第六天，从商店 1 购买物品 0 ，开销为 values[1][0]* 6 = 36 。
第七天，从商店 2 购买物品 1 ，开销为 values[2][1] *7 = 49 。
第八天，从商店 0 购买物品 0 ，开销为 values[0][0]* 8 = 64 。
第九天，从商店 2 购买物品 0 ，开销为 values[2][0] *9 = 81 。
所以总开销为 285 。
285 是购买所有 m* n 件物品的最大总开销。。

示例 2：
>输入：values = [[10,8,6,4,2],[9,7,5,3,2]]
输出：386
解释：第一天，从商店 0 购买物品 4 ，开销为 values[0][4] *1 = 2 。
第二天，从商店 1 购买物品 4 ，开销为 values[1][4]* 2 = 4 。
第三天，从商店 1 购买物品 3 ，开销为 values[1][3] *3 = 9 。
第四天，从商店 0 购买物品 3 ，开销为 values[0][3]* 4 = 16 。
第五天，从商店 1 购买物品 2 ，开销为 values[1][2] *5 = 25 。
第六天，从商店 0 购买物品 2 ，开销为 values[0][2]* 6 = 36 。
第七天，从商店 1 购买物品 1 ，开销为 values[1][1] *7 = 49 。
第八天，从商店 0 购买物品 1 ，开销为 values[0][1]* 8 = 64 。
第九天，从商店 1 购买物品 0 ，开销为 values[1][0] *9 = 81 。
第十天，从商店 0 购买物品 0 ，开销为 values[0][0]* 10 = 100 。
所以总开销为 386 。
386 是购买所有 m * n 件物品的最大总开销。

提示：

- 1 <= m == values.length <= 10
- 1 <= n == values[i].length <= 104
- 1 <= values[i][j] <= 106
- values[i] 按照非递增顺序排序。

---

```go
func maxSpending(values [][]int) int64 {
    
}
```

---

{{< togglecontent label="🧠思路:  👈点击" >}}

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
{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

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

{{< /togglecontent >}}
