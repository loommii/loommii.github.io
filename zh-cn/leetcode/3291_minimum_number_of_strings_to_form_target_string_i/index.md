# 3291_形成目标字符串需要的最少字符串数_I


{{< details summary="🧠思路:  👈点击" >}}

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

{{< /details >}}

---

{{< details summary="🔑 答案解析： 👈点击" >}}

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

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3291_minimum_number_of_strings_to_form_target_string_i/  

