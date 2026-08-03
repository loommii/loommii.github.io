# 15. 3Sum



```go
func threeSum(nums []int) [][]int {
	ans := make([][]int, 0)
	// Sort the array
	// Since the order of the output and the triplets is not important, we sort the original array in ascending order for easier processing
	sort.Ints(nums)

	// Iterate to select the first number K so that the numbers J and L on both sides sum to the negation of K, J + L = -K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // There are at least 2 numbers left, so we only need to iterate up to len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // Skip duplicates; there is no previous number when i == 0
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
				// Found the target
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// Avoid duplicates: check whether the adjacent numbers are also duplicates, and skip them if so
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
	// Sort the array
	// Since the order of the output and the triplets is not important, we sort the original array in ascending order for easier processing
	sort.Ints(nums)

	// Iterate to select the first number K so that the numbers J and L on both sides sum to the negation of K, J + L = -K
	n := len(nums)
	for i := 0; i < len(nums)-2; i++ { // There are at least 2 numbers left, so we only need to iterate up to len(nums)-2
		if i > 0 && nums[i] == nums[i-1] { // Skip duplicates; there is no previous number when i == 0
			continue
		}
		// Optimization 1: if the two smallest numbers plus nums[i] are already > 0, no need to continue
		if nums[i]+nums[i+1]+nums[i+2] > 0 {
			continue
		}
		// Optimization 1: if the two largest numbers plus nums[i] are already < 0, no need to continue
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
				// Found the target
				ans = append(ans, []int{nums[i], nums[j], nums[l]})
				// Avoid duplicates: check whether the adjacent numbers are also duplicates, and skip them if so
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/15_3sum/  

