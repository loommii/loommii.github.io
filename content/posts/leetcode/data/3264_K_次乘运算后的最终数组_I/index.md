---
date: '2024-12-13T15:58:17+08:00'
draft: false
title: '3264_K_次乘运算后的最终数组_I'
---
力扣链接:[3264. K 次乘运算后的最终数组 I](https://leetcode.cn/problems/final-array-state-after-k-multiplication-operations-i/description/?envType=daily-question&envId=2024-12-13)

力扣难度 `简单`

算法评级: 3      理解常用数据结构和算法

难度分 1178

---
题目:
给你一个整数数组 nums ，一个整数 k  和一个整数 multiplier 。

你需要对 nums 执行 k 次操作，每次操作中：

- 找到 nums 中的 最小 值 x ，如果存在多个最小值，选择最 前面 的一个。
- 将 x 替换为 x * multiplier 。

请你返回执行完 k 次乘运算之后，最终的 nums 数组。

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

遍历nums找最小

{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

### 遍历

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
    return nums
}

```

{{< /togglecontent >}}
