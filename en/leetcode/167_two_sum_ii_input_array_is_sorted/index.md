# 167. Two Sum II - Input Array Is Sorted



```go
func twoSum(numbers []int, target int) (ans []int) {
	// Two pointers: head points to the smallest, tail points to the largest
	// If head + tail < target, move the head pointer toward the tail
	// If head + tail > target, move the tail pointer toward the head
	// If head + tail == target, return the answer
	// If the two pointers meet, return nil
	j := 0
	k := len(numbers) - 1
	for j < k {
		f := target - (numbers[j] + numbers[k])
		if f == 0 {
			return []int{j + 1, k + 1}
		} else if f > 0 {
			j++
		} else if f < 0 {
			k--
		}
	}
	return
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/167_two_sum_ii_input_array_is_sorted/  

