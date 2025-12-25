---
date: '2025-01-07T21:47:21+08:00'
draft: false
title: '3019_按键变更的次数'
---
力扣链接:[3019. 按键变更的次数](https://leetcode.cn/problems/number-of-changing-keys/description/)

力扣难度 `简单`
算法评级: 2      知道常用数据结构和算法并简单使用
难度分 1176

---
题目:

给你一个下标从 0 开始的字符串 s ，该字符串由用户输入。按键变更的定义是：使用与上次使用的按键不同的键。例如 s = "ab" 表示按键变更一次，而 s = "bBBb" 不存在按键变更。

返回用户输入过程中按键变更的次数。

注意：shift 或 caps lock 等修饰键不计入按键变更，也就是说，如果用户先输入字母 'a' 然后输入字母 'A' ，不算作按键变更。

示例 1：

> 输入：s = "aAbBcC"  
> 输出：2  
> 解释：
> 从 s[0] = 'a' 到 s[1] = 'A'，不存在按键变更，因为不计入 caps lock 或 shift 。  
> 从 s[1] = 'A' 到 s[2] = 'b'，按键变更。  
> 从 s[2] = 'b' 到 s[3] = 'B'，不存在按键变更，因为不计入 caps lock 或 shift 。  
> 从 s[3] = 'B' 到 s[4] = 'c'，按键变更。  
> 从 s[4] = 'c' 到 s[5] = 'C'，不存在按键变更，因为不计入 caps lock 或 shift 。  

示例 2：

> 输入：s = "AaAaAaaA"  
> 输出：0  
> 解释： 不存在按键变更，因为这个过程中只按下字母 'a' 和 'A' ，不需要进行按键变更。  

---

```go
func countKeyChanges(s string) (ans int) {
    
}
```

---
{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
func countKeyChanges(s string) (ans int) {
    n := len(s)
    for i := 1; i < n; i++ {
        if s[i-1]&31 != s[i]&31 {
            ans++
        }
    }
    return
}

```

{{< /togglecontent >}}
