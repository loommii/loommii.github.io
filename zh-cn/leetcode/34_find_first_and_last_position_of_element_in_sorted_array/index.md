# 34_在排序数组中查找元素的第一个和最后一个位置



```go
func searchRange(nums []int, target int) []int {
    
}
```

---

```go
func searchRange(nums []int, target int) []int {
	// 暴力遍历
	// 时间复杂度 On
	// 空间复杂度 O1
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
	// 二分查找 + 遍历
	// 时间复杂度 O(Logn)
	// 空间复杂度 O(1)

	ans := []int{-1, -1}
	// 二分查找
	// 找到了目标数以后左右扩展下标

	n := len(nums) //
	// 折半查找法
	index := binSearch(nums, target, 0, n-1)
	if index == -1 {
		return ans
	}
	// 下标存在的
	for i := index; i > -1 && nums[i] == target; i-- { // 左扩张
		ans[0] = i
	}
	for i := index; i < n && nums[i] == target; i++ { // 右扩张
		ans[1] = i
	}
	return ans
}
func binSearch(nums []int, target int, j, y int) int {
	// j 是头
	// y 是尾
	// 查找到的话就返回下标 否者就是-1
	if y < j {
		return -1
	}
	// 获取中间数
	// midIndex := (j + y) / 2 
    midIndex := j + (y - j) / 2 
	if nums[midIndex] == target {
		return midIndex
	}
	// 左边
	index := binSearch(nums, target, j, midIndex-1)
	if index != -1 {
		return index
	}
	// 左边
	index = binSearch(nums, target, midIndex+1, y)
	if index != -1 {
		return index
	}
	return -1
}
```

```go
func searchRange(nums []int, target int) []int {
	// 二分查找 红蓝染色法
	// 目的是符合 大于等于target的最小下标

	// 蓝色部分一定是 大于等于 目标值的
	// 红色部分一定是 小于 目标值的

	// 时间复杂度 O(Logn)
	// 空间复杂度 O(1)

	start := lowerBound(nums, target)
	if start == len(nums) || nums[start] != target {
		return []int{-1, -1} // nums 中没有 target
	}
	end := lowerBound(nums, target+1) - 1
	return []int{start, end}
}
func lowerBound(nums []int, target int) int {
	left, right := 0, len(nums)-1 // 闭区间 [left, right]
	for left <= right {           // 区间不为空
		mid := left + (right-left)/2 // 区中间值
		if nums[mid] >= target {     // 若中间值大了, 中间值右边部分会被染成蓝色
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	// left 指向的就是红色 + 1
	// right 指向的就是蓝色 - 1
	return left
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/34_find_first_and_last_position_of_element_in_sorted_array/  

