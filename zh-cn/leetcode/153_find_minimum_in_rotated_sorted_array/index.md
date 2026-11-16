# 153. 寻找旋转排序数组中的最小值



**提示：**

*   `n == nums.length`
*   `1 <= n <= 5000`
*   `-5000 <= nums[i] <= 5000`
*   `nums` 中的所有整数 **互不相同**
*   `nums` 原来是一个升序排序的数组，并进行了 `1` 至 `n` 次旋转

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
	// 二分查找 红蓝染色法
	n := len(nums)
	left, right := 0, n-1
	for left < right {
		mid := left + (right-left)/2
		if nums[mid] < nums[right] {
			//  染蓝
			right = mid
		} else {
			//  染红
			left = mid + 1
		}
	}
	return nums[right]
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/153_find_minimum_in_rotated_sorted_array/  

