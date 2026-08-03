# 713. 乘积小于 K 的子数组



```go
func numSubarrayProductLessThanK(nums []int, k int) int {
    
}
```

---

```go
func numSubarrayProductLessThanK(nums []int, k int) int {
	if k <= 1 {
		return 0
	}
	ans := 0
	prod := 1 // 乘积
	left := 0
	for right, num := range nums {
		prod *= num
		for prod >= k {
			prod = prod / nums[left]
			left++
		}
		ans += right - left + 1
	}
	return ans
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/713_subarray_product_less_than_k/  

