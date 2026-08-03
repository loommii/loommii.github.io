# 1295_统计位数为偶数的数字



```go
func findNumbers(nums []int) int {
	// 计数
	ans := 0
	for _, v := range nums {
		i := 0
		for v != 0 {
			i++
			v /= 10
		}
		if i%2 == 0 {
			ans++
		}
	}
	return ans
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1295_find_numbers_with_even_number_of_digits/  

