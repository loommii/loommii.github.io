---
date: '2025-02-16T23:49:25+08:00'
draft: false
title: '1299_将每个元素替换为右侧最大元素'
---
力扣链接: [1299. 将每个元素替换为右侧最大元素](https://leetcode.cn/problems/replace-elements-with-greatest-element-on-right-side/description/)

> 力扣难度 `简单`
>
> 算法评级:  3      理解常用数据结构和算法
>
> 难度分 1219

---
题目:
给你一个数组 arr ，请你将每个元素用它右边最大的元素替换，如果是最后一个元素，用 -1 替换。

完成所有替换操作后，请你返回这个数组。

---
示例 1：

> 输入：arr = [17,18,5,4,6,1]
> 输出：[18,6,6,6,1,-1]
> 解释：
>
> - 下标 0 的元素 --> 右侧最大元素是下标 1 的元素 (18)
> - 下标 1 的元素 --> 右侧最大元素是下标 4 的元素 (6)
> - 下标 2 的元素 --> 右侧最大元素是下标 4 的元素 (6)
> - 下标 3 的元素 --> 右侧最大元素是下标 4 的元素 (6)
> - 下标 4 的元素 --> 右侧最大元素是下标 5 的元素 (1)
> - 下标 5 的元素 --> 右侧没有其他元素，替换为 -1

示例 2：

> 输入：arr = [400]
> 输出：[-1]
> 解释：下标 0 的元素右侧没有其他元素。
---

```go
func replaceElements(arr []int) []int {
    
}
```

---

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
// 暴力
func replaceElements(arr []int) []int {
    n := len(arr)
    ans := make([]int, n)
    for i := 0; i < n; i++ {
        maxV := -1
        for j := i + 1; j < n; j++ {
            maxV = max(maxV, arr[j])
        }
        ans[i] = maxV
    }
    return ans
}
```

```go
// DP 从后往前 维护最大值
func replaceElements(arr []int) []int {
    n := len(arr)
    ans := make([]int, n)
    ans[n-1] = -1
    for i := n - 2; i >= 0; i-- {
        ans[i] = max(arr[i+1], ans[i+1])
    }
    return ans
}
```

{{< /togglecontent >}}
