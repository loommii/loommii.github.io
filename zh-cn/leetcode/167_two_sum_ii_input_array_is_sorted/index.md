# 167. 两数之和 II - 输入有序数组



```go
func twoSum(numbers []int, target int) (ans []int) {
	// 双指针 头指向最小 尾指向最大
	// 头 + 尾 < 目标数 头指针就要往尾移动
	// 头 + 尾 > 目标数 尾指针就要往头移动
	// 头 + 尾 = 目标数 返回答案
	// 双指针 相遇 返回 nil
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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/167_two_sum_ii_input_array_is_sorted/  

