# 11. Container With Most Water



```go
func maxArea(height []int) int {
	ans := 0

	i := 0               // left pointer index
	j := len(height) - 1 // right pointer index

	// loop
	for i < j {
		// current area
		ans = max(ans, min(height[j], height[i])*(j-i)) // min height * width
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/11_container_with_most_water/  

