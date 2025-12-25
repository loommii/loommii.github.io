---
date: '2025-05-06T15:49:39+08:00'
draft: false
title: '3. 无重复字符的最长子串'
---
力扣链接: https://leetcode.cn/problems/longest-substring-without-repeating-characters/description/

> 力扣难度 `中等`  

---
给定一个字符串 `s` ，请你找出其中不含有重复字符的 **最长子串** 的长度。

## 示例

### 示例 1:

*   **输入:** `s = "abcabcbb"`
*   **输出:** `3`
*   **解释:** 因为无重复字符的最长子串是 `"abc"`，所以其长度为 3。

### 示例 2:

*   **输入:** `s = "bbbbb"`
*   **输出:** `1`
*   **解释:** 因为无重复字符的最长子串是 `"b"`，所以其长度为 1。

### 示例 3:

*   **输入:** `s = "pwwkew"`
*   **输出:** `3`
*   **解释:** 因为无重复字符的最长子串是 `"wke"`，所以其长度为 3。
    > 请注意，你的答案必须是 **子串** 的长度，`"pwke"` 是一个 *子序列*，不是子串。

## 提示：

*   `0 <= s.length <= 5 * 10^4`
*   `s` 由英文字母、数字、符号和空格组成
---

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