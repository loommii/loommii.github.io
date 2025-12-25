---
date: '2025-05-07T15:38:31+08:00'
draft: false
title: '34_在排序数组中查找元素的第一个和最后一个位置'
---
力扣链接:[34. 在排序数组中查找元素的第一个和最后一个位置](https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/description/)

> 力扣难度 `中等`  

---
给你一个按照非递减顺序排列的整数数组 `nums`，和一个目标值 `target`。请你找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 `target`，返回 `[-1, -1]`。

你必须设计并实现时间复杂度为 **O(log n)** 的算法解决此问题。

## 示例

### 示例 1：

*   **输入：**`nums = [5,7,7,8,8,10]`, `target = 8`
*   **输出：**`[3,4]`

### 示例 2：

*   **输入：**`nums = [5,7,7,8,8,10]`, `target = 6`
*   **输出：**`[-1,-1]`

### 示例 3：

*   **输入：**`nums = []`, `target = 0`
*   **输出：**`[-1,-1]`

## 提示：

*   `0 <= nums.length <= 10^5`
*   `-10^9 <= nums[i] <= 10^9`
*   `nums` 是一个非递减数组
*   `-10^9 <= target <= 10^9`
---

```go
func searchRange(nums []int, target int) []int {
    
}
```

---

```go
func searchRange(nums []int, target int) []int {
	// 暴力遍历
	// 时间复杂度 On
	// 空间复杂度 O1
	ans := []int{-1, -1}
	for i, num := range nums {
		if target == num {
			if ans[0] == -1 {
				ans[0] = i
			}
			ans[1] = max(ans[1], i)
		}
	}
	return ans
}
```

```go
func searchRange(nums []int, target int) []int {
	// 二分查找 + 遍历
	// 时间复杂度 O(Logn)
	// 空间复杂度 O(1)

	ans := []int{-1, -1}
	// 二分查找
	// 找到了目标数以后左右扩展下标

	n := len(nums) //
	// 折半查找法
	index := binSearch(nums, target, 0, n-1)
	if index == -1 {
		return ans
	}
	// 下标存在的
	for i := index; i > -1 && nums[i] == target; i-- { // 左扩张
		ans[0] = i
	}
	for i := index; i < n && nums[i] == target; i++ { // 右扩张
		ans[1] = i
	}
	return ans
}
func binSearch(nums []int, target int, j, y int) int {
	// j 是头
	// y 是尾
	// 查找到的话就返回下标 否者就是-1
	if y < j {
		return -1
	}
	// 获取中间数
	// midIndex := (j + y) / 2 
    midIndex := j + (y - j) / 2 
	if nums[midIndex] == target {
		return midIndex
	}
	// 左边
	index := binSearch(nums, target, j, midIndex-1)
	if index != -1 {
		return index
	}
	// 左边
	index = binSearch(nums, target, midIndex+1, y)
	if index != -1 {
		return index
	}
	return -1
}
```

```go
func searchRange(nums []int, target int) []int {
	// 二分查找 红蓝染色法
	// 目的是符合 大于等于target的最小下标

	// 蓝色部分一定是 大于等于 目标值的
	// 红色部分一定是 小于 目标值的

	// 时间复杂度 O(Logn)
	// 空间复杂度 O(1)

	start := lowerBound(nums, target)
	if start == len(nums) || nums[start] != target {
		return []int{-1, -1} // nums 中没有 target
	}
	end := lowerBound(nums, target+1) - 1
	return []int{start, end}
}
func lowerBound(nums []int, target int) int {
	left, right := 0, len(nums)-1 // 闭区间 [left, right]
	for left <= right {           // 区间不为空
		mid := left + (right-left)/2 // 区中间值
		if nums[mid] >= target {     // 若中间值大了, 中间值右边部分会被染成蓝色
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	// left 指向的就是红色 + 1
	// right 指向的就是蓝色 - 1
	return left
}
```