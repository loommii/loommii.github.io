---
date: '2024-12-11T00:35:39+08:00'
draft: false
title: '2717_半有序排列'
---
力扣链接:[2717. 半有序排列](https://leetcode.cn/problems/semi-ordered-permutation/description/?envType=daily-question&envId=2024-12-11)

力扣难度 `简单`
算法评级: 3      理解常用数据结构和算法
难度分 1296

---
题目:

给你一个下标从 `0` 开始、长度为 `n` 的整数排列 `nums` 。

如果排列的第一个数字等于 `1` 且最后一个数字等于 `n`，则称其为 半有序排列 。你可以执行多次下述操作，直到将 `nums` 变成一个 半有序排列 ：

---
示例 1：
>输入：nums = [2,1,4,3]
输出：2
解释：可以依次执行下述操作得到半有序排列：
1 - 交换下标 0 和下标 1 对应元素。排列变为 [1,2,4,3] 。
2 - 交换下标 2 和下标 3 对应元素。排列变为 [1,2,3,4] 。
可以证明，要让 nums 成为半有序排列，不存在执行操作少于 2 次的方案。

示例 2：
>输入：nums = [2,4,1,3]
输出：3
解释：
可以依次执行下述操作得到半有序排列：
1 - 交换下标 1 和下标 2 对应元素。排列变为 [2,1,4,3] 。
2 - 交换下标 0 和下标 1 对应元素。排列变为 [1,2,4,3] 。
3 - 交换下标 2 和下标 3 对应元素。排列变为 [1,2,3,4] 。
可以证明，要让 nums 成为半有序排列，不存在执行操作少于 3 次的方案。

示例 3：
>输入：nums = [1,3,4,2,5]
输出：0
解释：这个排列已经是一个半有序排列，无需执行任何操作。

提示：

- 2 <= nums.length == n <= 50
- 1 <= nums[i] <= 50
- nums 是一个 排列

---

```go
func semiOrderedPermutation(nums []int) int {
    
}
```

---

{{< togglecontent label="🧠思路:  👈点击" >}}

遍历一遍记录最小和最大值对应的下标
假则最小为j,则需要移动j次
最大为k，则需要移动n-1-k次
存在一种特殊启动, 小下标 比 大下标大的情况。移动小下标时会移动到大下标。因此次数会少1

{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
func semiOrderedPermutation(nums []int) int {
    j, k := 0, 0
    n := len(nums)
    for i, v := range nums {
        if v == 1 {
            j = i
        }
        if v == n {
            k = i
        }
    }
    ans := j
    ans += (n - 1 - k)
    if j > k {
        ans--
    }
    return ans
}

```

{{< /togglecontent >}}
