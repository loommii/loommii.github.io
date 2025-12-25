---
date: '2025-04-30T17:24:19+08:00'
draft: false
title: '1295_统计位数为偶数的数字'
---
力扣链接: [1295. 统计位数为偶数的数字](https://leetcode.cn/problems/find-numbers-with-even-number-of-digits/description/)

> 力扣难度 `简单`

给你一个整数数组 `nums`，请你返回其中包含 **偶数** 个数位的数字的个数。

### 示例 1：

**输入：**`nums = [12,345,2,6,7896]`
**输出：**`2`
**解释：**
*   `12` 是 2 位数字（位数为偶数）
*   `345` 是 3 位数字（位数为奇数）
*   `2` 是 1 位数字（位数为奇数）
*   `6` 是 1 位数字（位数为奇数）
*   `7896` 是 4 位数字（位数为偶数）

因此只有 `12` 和 `7896` 是位数为偶数的数字。

### 示例 2：

**输入：**`nums = [555,901,482,1771]`
**输出：**`1`
**解释：**
只有 `1771` 是位数为偶数的数字。

### 提示：

*   `1 <= nums.length <= 500`
*   `1 <= nums[i] <= 105`

---

```go
func findNumbers(nums []int) int {
    
}
```

---

```go
func findNumbers(nums []int) int {
	// 计数
	ans := 0
	for _, v := range nums {
		i := 0
		for v != 0 {
			i++
			v /= 10
		}
		if i%2 == 0 {
			ans++
		}
	}
	return ans
}
```