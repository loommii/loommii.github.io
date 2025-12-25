---
date: '2025-02-17T17:56:19+08:00'
draft: false
title: '1287_有序数组中出现次数超过25%的元素'
---
力扣链接: [1287. 有序数组中出现次数超过25%的元素](https://leetcode.cn/problems/element-appearing-more-than-25-in-sorted-array/description/)

> 力扣难度 `简单`
>
> 算法评级:  3      理解常用数据结构和算法
>
> 难度分 1179

---
题目:
给你一个非递减的 有序 整数数组，已知这个数组中恰好有一个整数，它的出现次数超过数组元素总数的 25%。

请你找到并返回这个整数

---
示例：  
> 输入：arr = [1,2,2,6,6,6,6,7,10]  
> 输出：6  

提示：

- 1 <= arr.length <= 10^4
- 0 <= arr[i] <= 10^5

---

```go
func findSpecialInteger(arr []int) int {
    
}
```

{{< togglecontent label="👈点击" >}}
---

```go
func findSpecialInteger(arr []int) (ans int) {
    n := len(arr) / 4
    f := arr[0]
    i := 0
    for _, v := range arr {
        if v == f {
            i++
        } else {
            f = v
            i = 1
        }
        if i > n {
            ans = f
            break
        }
    }
    return
}
```

{{< /togglecontent >}}
