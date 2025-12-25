---
date: '2024-12-28T14:28:22+08:00'
draft: false
title: '3159_查询数组中元素的出现位置'
---
力扣链接:[3159. 查询数组中元素的出现位置](https://leetcode.cn/problems/find-occurrences-of-an-element-in-an-array/description/)

> 力扣难度 `中等`  
> 算法评级:  2      知道常用数据结构和算法并简单使用  
> 难度分 1263  

---
题目：
给你一个整数数组 nums ，一个整数数组 queries 和一个整数 x 。

对于每个查询 queries[i] ，你需要找到 nums 中第 queries[i] 个 x 的位置，并返回它的下标。如果数组中 x 的出现次数少于 queries[i] ，该查询的答案为 -1 。

请你返回一个整数数组 answer ，包含所有查询的答案。

示例 1：

>输入：nums = [1,3,1,7], queries = [1,3,2,4], x = 1
>
>输出：[0,-1,2,-1]
>
>解释：
>
>- 第 1 个查询，第一个 1 出现在下标 0 处。  
>- 第 2 个查询，nums 中只有两个 1 ，所以答案为 -1 。  
>- 第 3 个查询，第二个 1 出现在下标 2 处。  
>- 第 4 个查询，nums 中只有两个 1 ，所以答案为 -1 。  

示例 2：

>输入：nums = [1,2,3], queries = [10], x = 5
>
>输出：[-1]
>
>解释：
>
>- 第 1 个查询，nums 中没有 5 ，所以答案为 -1 。

---

```go
func occurrencesOfElement(nums, queries []int, x int) []int {

}
```

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
func occurrencesOfElement(nums, queries []int, x int) []int {
    queryLen := len(queries)
    ans := make([]int, queryLen)

    // 定义一个切片 indexList，用于存储目标元素 x 在 nums 数组中的所有索引位置
    var indexList []int
    // 遍历 nums 数组
    for i, v := range nums {
        // 如果当前元素 v 等于目标元素 x
        if v == x {
            // 将当前元素的索引 i 添加到 indexList 切片中
            indexList = append(indexList, i)
        }
    }

    // 遍历查询数组 queries
    for i, v := range queries {
        // 如果查询值 v 大于 indexList 切片的长度，说明查询的位置超出了目标元素 x 出现的次数
        if v > len(indexList) {
            // 在结果数组 ans 的对应位置存入 -1
            ans[i] = -1
        } else {
            // 在结果数组 ans 的对应位置存入 indexList 中索引为 v-1 的值
            ans[i] = indexList[v-1]
        }
    }

    return ans
}
```

{{< /togglecontent >}}
