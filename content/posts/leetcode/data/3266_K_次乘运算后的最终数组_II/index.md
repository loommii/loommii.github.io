---
date: '2024-12-14T12:13:03+08:00'
draft: false
title: '3266_K_次乘运算后的最终数组_II'
---
力扣链接:[3264. K 次乘运算后的最终数组 I](https://leetcode.cn/problems/final-array-state-after-k-multiplication-operations-i/description/?envType=daily-question&envId=2024-12-13)

力扣难度 `困难`

算法评级:  8      掌握不同的数据结构与算法之间的关联性，处理复杂问题，掌握高级数据结构

难度分 2509

---
题目:
给你一个整数数组 nums ，一个整数 k  和一个整数 multiplier 。

你需要对 nums 执行 k 次操作，每次操作中：

- 找到 nums 中的 最小 值 x ，如果存在多个最小值，选择最 前面 的一个
- 将 x 替换为 x * multiplier 。

k 次操作以后，你需要将 nums 中每一个数值对 109 + 7 取余。
请你返回执行完 k 次乘运算以及取余运算之后，最终的 nums 数组。

示例 1：

>输入：nums = [2,1,3,5,6], k = 5, multiplier = 2
>
>输出：[8,4,6,5,6]
>
>解释：
>
>|操作|结果|
>|:-|:-|
>|1 次操作后    |[2, 2, 3, 5, 6]
>|2 次操作后    |[4, 2, 3, 5, 6]
>|3 次操作后    |[4, 4, 3, 5, 6]
>|4 次操作后    |[4, 4, 6, 5, 6]
>|5 次操作后    |[8, 4, 6, 5, 6]

示例 2：

>输入：nums = [1,2], k = 3, multiplier = 4
>
>输出：[16,8]
>
>解释：
>
>|操作|结果|
>|:-|:-|
>|1 次操作后    |[4, 2]
>|2 次操作后    |[4, 8]
>|3 次操作后    |[16, 8]

提示：

- 1 <= nums.length <= 100
- 1 <= nums[i] <= 100
- 1 <= k <= 10
- 1 <= multiplier <= 5

---

```go
func getFinalState(nums []int, k int, multiplier int) []int {
    
}
```

---

{{< togglecontent label="🧠思路:  👈点击" >}}

与3264_K_次乘运算后的最终数组_I题目类似，只是增加了数据量导致通过遍历查找最小数会超时，因此需要使用堆的方式
我们寻找的是最小值,因此可以使用最小堆

{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

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

{{< /togglecontent >}}
