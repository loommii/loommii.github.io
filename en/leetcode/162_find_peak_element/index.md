# 162. Find Peak Element



```go
func findPeakElement(nums []int) int {
    
}
```

---

```go
func findPeakElement(nums []int) (idx int) {
	// Brute force traversal to find the maximum value
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
	// Binary search using the red-blue coloring method

	// The first blue number is the answer

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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/162_find_peak_element/  

