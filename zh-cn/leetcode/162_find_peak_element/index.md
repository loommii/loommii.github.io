# 162. 寻找峰值



```go
func findPeakElement(nums []int) int {
    
}
```

---

```go
func findPeakElement(nums []int) (idx int) {
	// 暴力遍历找最大值
	for i, v := range nums {
		if v > nums[idx] {
			idx = i
		}
	}
	return
}
```

```go
func findPeakElement(nums []int) (idx int) {
	// 二分查找 红蓝染色法

	// 蓝色的第一个数就是答案

	left := 0
	right := len(nums) - 1
	for left < right {
		mid := left + (right-left)/2
		if nums[mid] < nums[mid+1] {
			left = mid + 1
		} else {
			right = mid
		}
	}
	return right
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/162_find_peak_element/  

