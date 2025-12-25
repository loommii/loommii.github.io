---
date: '2025-01-08T14:00:23+08:00'
draft: false
title: '2264_字符串中最大的3位相同数字'
---
力扣链接:[2264. 字符串中最大的 3 位相同数字](https://leetcode.cn/problems/largest-3-same-digit-number-in-string/description/)

> 力扣难度 `简单`  
> 算法评级: 2  
> 难度分 1309

---
题目：

给你一个字符串 num ，表示一个大整数。如果一个整数满足下述所有条件，则认为该整数是一个 优质整数 ：

- 该整数是 num 的一个长度为 3 的 子字符串 。
- 该整数由唯一一个数字重复 3 次组成。

以字符串形式返回 最大的优质整数 。如果不存在满足要求的整数，则返回一个空字符串 "" 。

注意：

- 子字符串 是字符串中的一个连续字符序列。
- num 或优质整数中可能存在 前导零 。

示例 1：
> 输入：num = "6777133339"  
> 输出："777"  
> 解释：num 中存在两个优质整数："777" 和 "333" 。  
> "777" 是最大的那个，所以返回 "777" 。  

示例 2：
> 输入：num = "2300019"  
> 输出："000"  
> 解释："000" 是唯一一个优质整数。  

示例 3：

> 输入：num = "42352338"  
> 输出：""  
> 解释：不存在长度为 3 且仅由一个唯一数字组成的整数。因此，不存在优质整数。  

---

```go
func largestGoodInteger(num string) (ans string) {
    
}
```

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
func largestGoodInteger(num string) (ans string) {
    n := len(num)
    sig := struct {
        n int // 数字
        i int // 重复次数
    }{
        n: -1,
    }
    maxn := -1 //
    for i := 0; i < n; i++ {
        if sig.n == int(num[i]-'0') { // 重复的
            sig.i += 1 //重复次数+1
        } else {
            sig.n = int(num[i] - '0')
            sig.i = 1
        }
        if sig.i >= 3 { // 重复次数 大于等于3了
            maxn = max(sig.n, maxn)
        }
    }
    if maxn == -1 {
        return ""
    }
    ans = strings.Repeat(string(maxn+'0'), 3)
    return
}
```

{{< /togglecontent >}}
