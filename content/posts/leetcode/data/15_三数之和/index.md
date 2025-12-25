---
date: '2025-05-05T15:38:02+08:00'
draft: false
title: '15. 三数之和'
---
力扣链接:[15. 三数之和](https://leetcode.cn/problems/3sum/description/)

> 力扣难度 `中等`  


给你一个整数数组 `nums` ，判断是否存在三元组 `[nums[i], nums[j], nums[k]]` 满足 `i != j`、`i != k` 且 `j != k` ，同时还满足 `nums[i] + nums[j] + nums[k] == 0` 。请你返回所有和为 0 且不重复的三元组。

**注意：** 答案中不可以包含重复的三元组。

## 示例

### 示例 1：

*   **输入：**`nums = [-1,0,1,2,-1,-4]`
*   **输出：**`[[-1,-1,2],[-1,0,1]]`
*   **解释：**
    *   `nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0` 。
    *   `nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0` 。
    *   `nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0` 。
    *   不同的三元组是 `[-1,0,1]` 和 `[-1,-1,2]` 。
    *   注意，输出的顺序和三元组的顺序并不重要。

### 示例 2：

*   **输入：**`nums = [0,1,1]`
*   **输出：**`[]`
*   **解释：**> 唯一可能的三元组和不为 0 。

### 示例 3：

*   **输入：**`nums = [0,0,0]`
*   **输出：**`[[0,0,0]]`
*   **解释：**> 唯一可能的三元组和为 0 。

## 提示：

*   `3 <= nums.length <= 3000`
*   `-10^5 <= nums[i] <= 10^5`

---

```go
func threeSum(nums []int) [][]int {
    
}
```

---

```go
func threeSum(nums []int) [][]int {
	ans := make([][]int, 0)
	// 数组排序
	// 因为 输出的顺序和三元组的顺序并不重要，因此我们将原数组顺序打乱，按照从小到大排序方便后续处理
	sort.Ints(nums)

	// 便利选择第一个数数 K 使得后面两边的数 J L 两个数加起来 等于 K的倒数 J + L = - K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // 后面至少还有2个数，因此需要遍历到len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // 重复要跳过 i == 0 时前面没有数
			continue
		}
       
		j := i + 1
		l := n - 1
		for j < l {
			s := nums[i] + nums[j] + nums[l]
			if s > 0 {
				l--
			} else if s < 0 {
				j++
			} else {
				// 找到目标
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// 避免重复 继续看一下相临的数是否重复，是的话都跳过
				j++
				for j < l && nums[j] == nums[j-1] {
					j++
				}
				l--
				for j < l && nums[l] == nums[l+1] {
					l--
				}
			}
		}
	}
	return ans
}
```

```go
func threeSum(nums []int) [][]int {
	ans := make([][]int, 0)
	// 数组排序
	// 因为 输出的顺序和三元组的顺序并不重要，因此我们将原数组顺序打乱，按照从小到大排序方便后续处理
	sort.Ints(nums)

	// 便利选择第一个数数 K 使得后面两边的数 J L 两个数加起来 等于 K的倒数 J + L = - K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // 后面至少还有2个数，因此需要遍历到len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // 重复要跳过 i == 0 时前面没有数
			continue
		}
		// 优化 一 最小的2个数和nums[i]加起来都>0 这不用进入
		if nums[i]+nums[i+1]+nums[i+2] > 0 {
			continue
		}
		// 优化 一 最大的2个数和nums[i]加起来都<0 这不用进入
		if nums[i]+nums[n-1]+nums[n-2] < 0 {
			continue
		}
		j := i + 1
		l := n - 1
		for j < l {
			s := nums[i] + nums[j] + nums[l]
			if s > 0 {
				l--
			} else if s < 0 {
				j++
			} else {
				// 找到目标
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// 避免重复 继续看一下相临的数是否重复，是的话都跳过
				j++
				for j < l && nums[j] == nums[j-1] {
					j++
				}
				l--
				for j < l && nums[l] == nums[l+1] {
					l--
				}
			}
		}
	}
	return ans
}
```