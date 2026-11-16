# 153. Find Minimum in Rotated Sorted Array



**Constraints:**

*   `n == nums.length`
*   `1 <= n <= 5000`
*   `-5000 <= nums[i] <= 5000`
*   All the integers of `nums` are **unique**
*   `nums` was originally sorted in ascending order and rotated between `1` and `n` times

---

```go
func findMin(nums []int) int {
    
}
```

---

```go
func findMin(nums []int) int {
	ans := nums[0]
	for i := 1; i < len(nums); i++ {
		ans = min(ans, nums[i])
	}
	return ans
}
```

```go
func findMin(nums []int) int {
	// Binary search: red-blue coloring method
	n := len(nums)
	left, right := 0, n-1
	for left < right {
		mid := left + (right-left)/2
		if nums[mid] < nums[right] {
			// color blue
			right = mid
		} else {
			// color red
			left = mid + 1
		}
	}
	return nums[right]
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/153_find_minimum_in_rotated_sorted_array/  

