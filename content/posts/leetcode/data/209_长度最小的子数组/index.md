---
date: '2025-05-05T20:19:46+08:00'
draft: false
title: '209. 长度最小的子数组'
---
力扣链接:[209. 长度最小的子数组](https://leetcode.cn/problems/minimum-size-subarray-sum/description/)

> 力扣难度 `中等`

---

给定一个含有 `n` 个正整数的数组和一个正整数 `target` 。

找出该数组中满足其总和大于等于 `target` 的长度最小的 **子数组** `[nums[l], nums[l+1], ..., nums[r-1], nums[r]]` ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

## 示例

### 示例 1：

*   **输入：**`target = 7`, `nums = [2,3,1,2,4,3]`
*   **输出：**`2`
*   **解释：**> 子数组 `[4,3]` 是该条件下的长度最小的子数组。

### 示例 2：

*   **输入：**`target = 4`, `nums = [1,4,4]`
*   **输出：**`1`

### 示例 3：

*   **输入：**`target = 11`, `nums = [1,1,1,1,1,1,1,1]`
*   **输出：**`0`

## 提示：

*   `1 <= target <= 10^9`
*   `1 <= nums.length <= 10^5`
*   `1 <= nums[i] <= 10^4`

## 进阶：

*   如果你已经实现 O(n) 时间复杂度的解法, 请尝试设计一个 O(n log(n)) 时间复杂度的解法。

---

```go
func minSubArrayLen(target int, nums []int) int {
    
}
```
---

```go
func minSubArrayLen(target int, nums []int) int {
	n := len(nums)
	ans := n + 1
	s := 0
	left := 0                      // 左边下标
	for right, num := range nums { // 右边下标
		s += num
		for s-nums[left] >= target {
			s -= nums[left]
			left++
		}
		if s >= target {
			ans = min(ans, right-left+1)
		}
	}
	if ans == n+1 {
		return 0
	}
	return ans
}
```

```go
func minSubArrayLen(target int, nums []int) int {
	n := len(nums)
	ans := n + 1
	s := 0
	left := 0                      // 左边下标
	for right, num := range nums { // 右边下标
		s += num
		for s >= target {
			ans = min(ans, right-left+1)
			s -= nums[left]
			left++
		}
	}
	if ans == n+1 {
		return 0
	}
	return ans
}
```