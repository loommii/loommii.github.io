---
date: '2024-12-28T18:04:37+08:00'
draft: false
title: '3083_字符串及其反转中是否存在同一子字符串'
---
力扣链接:[3083. 字符串及其反转中是否存在同一子字符串](https://leetcode.cn/problems/existence-of-a-substring-in-a-string-and-its-reverse/description/)

> 力扣难度 `简单`  
> 算法评级:  2      知道常用数据结构和算法并简单使用  
> 难度分 1173  

---
题目：  

给你一个字符串 s ，请你判断字符串 s 是否存在一个长度为 2 的子字符串，在其反转后的字符串中也出现。

如果存在这样的子字符串，返回 true；如果不存在，返回 false 。

示例 1：

> 输入：s = "leetcode"
>
> 输出：true
>
> 解释：子字符串 "ee" 的长度为 2，它也出现在 reverse(s) == "edocteel" 中。

示例 2：

> 输入：s = "abcba"
>
> 输出：true
>
> 解释：所有长度为 2 的子字符串 "ab"、"bc"、"cb"、"ba" 也都出现在 reverse(s) == "abcba" 中。

示例 3：

> 输入：s = "abcd"
>
> 输出：false
>
> 解释：字符串 s 中不存在满足「在其反转后的字符串中也出现」且长度为 2 的子字符串。

---

```go
func isSubstringPresent(s string) bool {
    
}
```

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
// isSubstringPresent 函数用于判断给定字符串 s 中是否存在一对字符的子串，
// 这对字符以相反的顺序也出现过。
func isSubstringPresent(s string) bool {
    // 创建一个 26×26 的布尔数组 vis，用于记录每对字符是否出现过。
    // 索引的含义是：vis[x][y] 表示字符 x 和字符 y 组成的子串是否出现过。
    // 这里的 x 和 y 是字符在字母表中的索引，从 0 到 25 分别对应 'a' 到 'z'。
    vis := [26][26]bool{} 

    // 遍历字符串 s，从第二个字符开始，因为要检查相邻的两个字符组成的子串。
    for i := 1; i < len(s); i++ {
        // 计算当前字符对中第一个字符在字母表中的索引。
        // 例如，如果字符是 'a'，则 x 为 0；如果是 'b'，则 x 为 1，以此类推。
        x := s[i-1] - 'a' 
        // 计算当前字符对中第二个字符在字母表中的索引。
        y := s[i] - 'a' 

        // 将当前字符对标记为已出现过。
        vis[x][y] = true 
        // 检查是否存在相反顺序的字符对。
        // 如果 vis[y][x] 为 true，说明字符 y 和字符 x 组成的子串也出现过，
        // 即找到了满足条件的子串，返回 true。
        if vis[y][x] { 
            return true
        }
    }
    // 如果遍历完整个字符串都没有找到满足条件的子串，返回 false。
    return false
}

```

{{< /togglecontent >}}
