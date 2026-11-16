# 11. 盛最多水的容器



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


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/11_container_with_most_water/  

