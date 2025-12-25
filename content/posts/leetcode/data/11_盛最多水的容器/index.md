---
date: '2025-05-05T16:31:16+08:00'
draft: false
title: '11. 盛最多水的容器'
---
力扣链接:[11. 盛最多水的容器](https://leetcode.cn/problems/container-with-most-water/description/)

> 力扣难度 `中等`  

给定一个长度为 `n` 的整数数组 `height` 。有 `n` 条垂线，第 `i` 条线的两个端点是 `(i, 0)` 和 `(i, height[i])` 。

找出其中的两条线，使得它们与 `x` 轴共同构成的容器可以容纳**最多**的水。

返回容器可以储存的最大水量。

**说明：** 你**不能倾斜容器**。

## 示例

### 示例 1：

![alt text](image.png)

*   **输入：**`[1,8,6,2,5,4,8,3,7]`
*   **输出：**`49`
*   **解释：**> 图中垂直线代表输入数组 `[1,8,6,2,5,4,8,3,7]`。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

### 示例 2：

*   **输入：**`height = [1,1]`
*   **输出：**`1`

## 提示：

*   `n == height.length`
*   `2 <= n <= 10^5`
*   `0 <= height[i] <= 10^4`

```go
func maxArea(height []int) int {
    
}
```

--- 

```go
func maxArea(height []int) int {
	ans := 0

	i := 0               // 左指针下标
	j := len(height) - 1 // 右指针下标

	// 循环
	for i < j {
		// 目前的面积
		ans = max(ans, min(height[j], height[i])*(j-i)) // 最小的高 * 相距的宽
		if height[i] <= height[j] {
			i++
		} else {
			j--
		}
	}
	return ans
}
```