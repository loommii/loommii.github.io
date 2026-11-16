# 3. 无重复字符的最长子串



```go
func lengthOfLongestSubstring(s string) int {
    
}
```

---

```go
func lengthOfLongestSubstring(s string) int {
	ans := 0
	left := 0 // 左下标
	store := make(map[byte]int)
	for right, i3 := range s {
		i2 := byte(i3)
		store[i2]++
		for store[i2] > 1 {
			store[s[left]]--
			left++
		}
		ans = max(ans, right-left+1)
	}
	return ans
}
```


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3_longest_substring_without_repeating_characters/  

