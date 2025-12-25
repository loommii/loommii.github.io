---
date: '2024-12-17T14:34:51+08:00'
draft: false
title: '3291_形成目标字符串需要的最少字符串数_I'
---
力扣链接:[3291. 形成目标字符串需要的最少字符串数 I](https://leetcode.cn/problems/minimum-number-of-valid-strings-to-form-target-i/description/?envType=daily-question&envId=2024-12-17)

> 力扣难度 `中等`
>
> 算法评级:  6      深入理解并灵活应用数据结构和算法，理解高级数据结构
>
> 难度分 2082

---
题目:
给你一个字符串数组 words 和一个字符串 target。

如果字符串 x 是 words 中 任意 字符串的
前缀
，则认为 x 是一个 有效 字符串。

现计划通过 连接 有效字符串形成 target ，请你计算并返回需要连接的 最少 字符串数量。如果无法通过这种方式形成 target，则返回 -1。

示例 1：
>输入： words = ["abc","aaaaa","bcdef"], target = "aabcdabc"
>
>输出： 3
>
>解释：
>
>target 字符串可以通过连接以下有效字符串形成：
>
> - words[1] 的长度为 2 的前缀，即 "aa"。
> - words[2] 的长度为 3 的前缀，即 "bcd"。
> - words[0] 的长度为 3 的前缀，即 "abc"。

示例 2：

> 输入： words = ["abababab","ab"], target = "ababaababa"
>
> 输出： 2
>
> 解释：
>
> target 字符串可以通过连接以下有效字符串形成：
>
> - words[0] 的长度为 5 的前缀，即 "ababa"。
> - words[0] 的长度为 5 的前缀，即 "ababa"。

示例 3：
>输入： words = ["abcdef"], target = "xyz"
>
>输出： -1

提示：

- 1 <= words.length <= 100
- 1 <= words[i].length <= 5 * 103
- 输入确保 sum(words[i].length) <= 105。
- words[i] 只包含小写英文字母。
- 1 <= target.length <= 5 * 103
- target 只包含小写英文字母。

---

```go
func minValidStrings(words []string, target string) int {
    
}
```

---
{{< togglecontent label="🧠思路:  👈点击" >}}

最少？ DP问题？

尝试拆子问题

XXXXABC  XXXXAED

EDFXXXX
假设我们已经匹配到这样了

当前字符串下一个字符是否匹配 T -> 进入下一个循环

当前字符串下一个字符是否匹配 F -> 选择字符串中第一个字符是否匹配 -T -> 进入下一个循环

当前字符串下一个字符是否匹配 F -> 选择字符串中第一个字符是否匹配 -F -> 此路不通

可以要同时匹配 当前字符串下一个字符是否匹配   和 选择字符串中第一个字符是否匹配  分2路走

先尝试写递归 深度遍历？

{{< /togglecontent >}}

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

### 递归(超时)

```go
func minValidStrings(words []string, target string) int {
    nT := len(target)
    var dfs func(int, int, int, int) int // 不通返回-1 通返回使用的字符串数
    dfs = func(ni, nii, nTi, ansi int) int {
        if nTi == nT { // 已经到最后了
            return ansi
        }
        ans1 := -1
        if len(words[ni]) > nii && words[ni][nii] == target[nTi] { // 当前字符串下一个字符是否匹配
            ans := dfs(ni, nii+1, nTi+1, ansi)
            if ans != -1 && ans1 == -1 {
                ans1 = ans
            } else if ans != -1 {
                ans1 = min(ans1, ans)
            }
        }

        for i, v := range words {
            if v[0] == target[nTi] {
                ans := dfs(i, 1, nTi+1, ansi+1)
                if ans != -1 && ans1 == -1 {
                    ans1 = ans
                } else if ans != -1 {
                    ans1 = min(ans1, ans)
                }
            }
        }
        return ans1
    }
    ans1 := -1
    for i, v := range words {
        if v[0] == target[0] {
            ans := dfs(i, 1, 1, 1)
            if ans != -1 && ans1 == -1 {
                ans1 = ans
            } else if ans != -1 {
                ans1 = min(ans1, ans)
            }
        }
    }
    return ans1
}
```

### 字符串哈希 + 二分

{{< /togglecontent >}}
