# 1295_Find Numbers With Even Number of Digits



```go
func findNumbers(nums []int) int {
	// count
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1295_find_numbers_with_even_number_of_digits/  

