# 15. 三数之和



```go
func threeSum(nums []int) [][]int {
	ans := make([][]int, 0)
	// 数组排序
	// 因为 输出的顺序和三元组的顺序并不重要，因此我们将原数组顺序打乱，按照从小到大排序方便后续处理
	sort.Ints(nums)

	// 便利选择第一个数数 K 使得后面两边的数 J L 两个数加起来 等于 K的倒数 J + L = - K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // 后面至少还有2个数，因此需要遍历到len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // 重复要跳过 i == 0 时前面没有数
			continue
		}
       
		j := i + 1
		l := n - 1
		for j < l {
			s := nums[i] + nums[j] + nums[l]
			if s > 0 {
				l--
			} else if s < 0 {
				j++
			} else {
				// 找到目标
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// 避免重复 继续看一下相临的数是否重复，是的话都跳过
				j++
				for j < l && nums[j] == nums[j-1] {
					j++
				}
				l--
				for j < l && nums[l] == nums[l+1] {
					l--
				}
			}
		}
	}
	return ans
}
```

```go
func threeSum(nums []int) [][]int {
	ans := make([][]int, 0)
	// 数组排序
	// 因为 输出的顺序和三元组的顺序并不重要，因此我们将原数组顺序打乱，按照从小到大排序方便后续处理
	sort.Ints(nums)

	// 便利选择第一个数数 K 使得后面两边的数 J L 两个数加起来 等于 K的倒数 J + L = - K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // 后面至少还有2个数，因此需要遍历到len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // 重复要跳过 i == 0 时前面没有数
			continue
		}
		// 优化 一 最小的2个数和nums[i]加起来都>0 这不用进入
		if nums[i]+nums[i+1]+nums[i+2] > 0 {
			continue
		}
		// 优化 一 最大的2个数和nums[i]加起来都<0 这不用进入
		if nums[i]+nums[n-1]+nums[n-2] < 0 {
			continue
		}
		j := i + 1
		l := n - 1
		for j < l {
			s := nums[i] + nums[j] + nums[l]
			if s > 0 {
				l--
			} else if s < 0 {
				j++
			} else {
				// 找到目标
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// 避免重复 继续看一下相临的数是否重复，是的话都跳过
				j++
				for j < l && nums[j] == nums[j-1] {
					j++
				}
				l--
				for j < l && nums[l] == nums[l+1] {
					l--
				}
			}
		}
	}
	return ans
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/15_3sum/  

