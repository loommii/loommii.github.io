---
date: '2024-12-22T15:09:23+08:00'
draft: false
title: '1387_将整数按权重排序'
---
力扣链接:[1387. 将整数按权重排序](https://leetcode.cn/problems/sort-integers-by-the-power-value/description/?envType=daily-question&envId=2024-12-22)

> 力扣难度 `中等`
>
> 算法评级:  6      深入理解并灵活应用数据结构和算法，理解高级数据结构
>
> 难度分 1507

---
题目：

我们将整数 x 的 权重 定义为按照下述规则将 x 变成 1 所需要的步数：

- 如果 x 是偶数，那么 x = x / 2
- 如果 x 是奇数，那么 x = 3 * x + 1

比方说，x=3 的权重为 7 。因为 3 需要 7 步变成 1 （3 --> 10 --> 5 --> 16 --> 8 --> 4 --> 2 --> 1）。

给你三个整数 lo， hi 和 k 。你的任务是将区间 [lo, hi] 之间的整数按照它们的权重 升序排序 ，如果大于等于 2 个整数有 相同 的权重，那么按照数字自身的数值 升序排序 。

请你返回区间 [lo, hi] 之间的整数按权重排序后的第 k 个数。

注意，题目保证对于任意整数 x （lo <= x <= hi） ，它变成 1 所需要的步数是一个 32 位有符号整数。

---

```go
func getKth(lo int, hi int, k int) int {
    
}
```

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go

type num struct {
    data   int
    weight int
}
type nlist []num

// 设置权重
func (n *num) SetWeight() {
    for i := n.data; i != 1; n.weight++ {
        if i%2 == 0 {
            i = i / 2
        } else {
            i = 3*i + 1
        }
    }
}
func (n nlist) Len() int {
    return len(n)
}
func (n nlist) Less(i, j int) bool {
    if n[i].weight > n[j].weight || (n[i].weight == n[j].weight && n[i].data > n[j].data) {
        return false
    }
    return true
}
func (n nlist) Swap(i, j int) {
    n[i], n[j] = n[j], n[i]
}
func getKth(lo int, hi int, k int) (ans int) {

    nums := make(nlist, hi-lo+1)
    // 记录走了多少步
    for i := range nums {
        nums[i].data = i + lo
        nums[i].SetWeight()
    }
    // 排序
    sort.Sort(nums)
    return nums[k-1].data
}
```

{{< /togglecontent >}}
