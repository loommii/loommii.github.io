---
date: '2024-12-15T15:36:23+08:00'
draft: false
title: '1338_数组大小减半'
---
力扣链接:[1338. 数组大小减半](https://leetcode.cn/problems/reduce-array-size-to-the-half/description/?envType=daily-question&envId=2024-12-15)

力扣难度 `中等`

算法评级: 3      理解常用数据结构和算法

难度分 1303

---
题目:
给你一个整数数组 arr。你可以从中选出一个整数集合，并删除这些整数在数组中的每次出现。

返回 至少 能删除数组中的一半整数的整数集合的最小大小

示例 1：

> 输入：arr = [3,3,3,3,5,5,5,2,2,7]
> 输出：2
> 解释：选择 {3,7} 使得结果数组为 [5,5,5,2,2]、长度为 5（原数组长度的一半）。
> 大小为 2 的可行集合有 {3,5},{3,2},{5,2}。
> 选择 {2,7} 是不可行的，它的结果数组为 [3,3,3,3,5,5,5]，新数组长度大于原数组的二分之一。

示例 2：

>输入：arr = [7,7,7,7,7,7]
>输出：1
>解释：我们只能选择集合 {7}，结果数组为空。

提示：

- 1 <= arr.length <= 105
- arr.length 为偶数
- 1 <= arr[i] <= 105

---

```go
func minSetSize(arr []int) int {
    
}
```

---

{{< togglecontent label="🧠思路:  👈点击" >}}

### 猜想

贪心的想法，先遍历一遍记录出现次数。从频率最高的开始删除
问题就变为了怎么记录次数后从大到小排序方便

{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

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

{{< /togglecontent >}}
