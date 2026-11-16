# 42. 接雨水



```go
func trap(height []int) int {
    
}
```

---

```go
func trap(height []int) int {
	ans := 0
	n := len(height)
	prefixMaxNum := make([]int, n)
	suffixMaxNum := make([]int, n)

	prefixMaxNum[0] = height[0]
	for i := 1; i < n; i++ {
		prefixMaxNum[i] = max(height[i], prefixMaxNum[i-1])
	}

	suffixMaxNum[n-1] = height[n-1]
	for i := n - 2; i >= 0; i-- {
		suffixMaxNum[i] = max(height[i], suffixMaxNum[i+1])
	}

	for i := 0; i < n; i++ {
		ans += min(prefixMaxNum[i], suffixMaxNum[i]) - height[i]
	}

	return ans
}
```

```go
func trap(height []int) int {
	ans := 0
	n := len(height)

	left := 0      // 指向最左边
	right := n - 1 // 指向最右边
	pro_max := 0   // 前缀最大值
	suf_max := 0   // 后缀最大值
	for left <= right {
		pro_max = max(pro_max, height[left])
		suf_max = max(suf_max, height[right])
		if pro_max < suf_max {
			ans += pro_max - height[left]
			left++
		} else {
			ans += suf_max - height[right]
			right--
		}
	}

	return ans
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/42_trapping_rain_water/  

