# 34_Find First and Last Position of Element in Sorted Array



```go
func searchRange(nums []int, target int) []int {
    
}
```

---

```go
func searchRange(nums []int, target int) []int {
	// Brute-force traversal
	// Time complexity O(n)
	// Space complexity O(1)
	ans := []int{-1, -1}
	for i, num := range nums {
		if target == num {
			if ans[0] == -1 {
				ans[0] = i
			}
			ans[1] = max(ans[1], i)
		}
	}
	return ans
}
```

```go
func searchRange(nums []int, target int) []int {
	// Binary search + traversal
	// Time complexity O(log n)
	// Space complexity O(1)

	ans := []int{-1, -1}
	// Binary search
	// After finding the target, expand the indices left and right

	n := len(nums) //
	// Half-interval search
	index := binSearch(nums, target, 0, n-1)
	if index == -1 {
		return ans
	}
	// The index exists
	for i := index; i > -1 && nums[i] == target; i-- { // Expand left
		ans[0] = i
	}
	for i := index; i < n && nums[i] == target; i++ { // Expand right
		ans[1] = i
	}
	return ans
}
func binSearch(nums []int, target int, j, y int) int {
	// j is the head
	// y is the tail
	// Return the index if found, otherwise -1
	if y < j {
		return -1
	}
	// Get the middle index
	// midIndex := (j + y) / 2 
    midIndex := j + (y - j) / 2 
	if nums[midIndex] == target {
		return midIndex
	}
	// Left side
	index := binSearch(nums, target, j, midIndex-1)
	if index != -1 {
		return index
	}
	// Left side
	index = binSearch(nums, target, midIndex+1, y)
	if index != -1 {
		return index
	}
	return -1
}
```

```go
func searchRange(nums []int, target int) []int {
	// Binary search with the red-blue coloring method
	// Goal: find the smallest index where nums[index] >= target

	// The blue part is always >= target
	// The red part is always < target

	// Time complexity O(log n)
	// Space complexity O(1)

	start := lowerBound(nums, target)
	if start == len(nums) || nums[start] != target {
		return []int{-1, -1} // target is not in nums
	}
	end := lowerBound(nums, target+1) - 1
	return []int{start, end}
}
func lowerBound(nums []int, target int) int {
	left, right := 0, len(nums)-1 // Closed interval [left, right]
	for left <= right {           // The interval is not empty
		mid := left + (right-left)/2 // Middle value of the interval
		if nums[mid] >= target {     // If the middle value is too large, the right part of the middle is colored blue
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	// left points to red + 1
	// right points to blue - 1
	return left
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/34_find_first_and_last_position_of_element_in_sorted_array/  

