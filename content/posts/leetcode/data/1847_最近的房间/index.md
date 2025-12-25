---
date: '2024-12-16T14:28:52+08:00'
draft: false
title: '1847_最近的房间'
---
力扣链接:[1847. 最近的房间](https://leetcode.cn/problems/closest-room/description/?envType=daily-question&envId=2024-12-16)

> 力扣难度 `困难`
>
> 算法评级: 8      掌握不同的数据结构与算法之间的关联性，处理复杂问题，掌握高级数据结构
>
> 难度分 2082
>

---
题目：

一个酒店里有 n 个房间，这些房间用二维整数数组 rooms 表示，其中 rooms[i] = [roomIdi, sizei] 表示有一个房间号为 roomIdi 的房间且它的面积为 sizei 。每一个房间号 roomIdi 保证是 独一无二 的。

同时给你 k 个查询，用二维数组 queries 表示，其中 queries[j] = [preferredj, minSizej] 。第 j 个查询的答案是满足如下条件的房间 id ：

- 房间的面积 至少 为 minSizej ，且abs(id - preferredj) 的值 最小 ，其中 abs(x) 是 x 的绝对值。

如果差的绝对值有 相等 的，选择 最小 的 id 。如果 没有满足条件的房间 ，答案为 -1 。

请你返回长度为 k 的数组 answer ，其中 answer[j] 为第 j 个查询的结果。

示例 1：

>输入：rooms = [[2,2],[1,2],[3,2]], queries = [[3,1],[3,3],[5,2]]
>
>输出：[3,-1,3]
>
>解释：查询的答案如下：
>
>查询 [3,1] ：房间 3 的面积为 2 ，大于等于 1 ，且号码是最接近 3 的，为 abs(3 - 3) = 0 ，所以答案为 3 。
>
>查询 [3,3] ：没有房间的面积至少为 3 ，所以答案为 -1 。
>
>查询 [5,2] ：房间 3 的面积为 2 ，大于等于 2 ，且号码是最接近 5 的，为 abs(3 - 5) = 2 ，所以答案为 3 。

示例 2：

>输入：rooms = [[1,4],[2,3],[3,5],[4,1],[5,2]], queries = [[2,3],[2,4],[2,5]]
>
>输出：[2,1,3]
>
>解释：查询的答案如下：
>
>查询 [2,3] ：房间 2 的面积为 3 ，大于等于 3 ，且号码是最接近的，为 abs(2 - 2) = 0 ，所以答案为 2 。
>
>查询 [2,4] ：房间 1 和 3 的面积都至少为 4 ，答案为 1 因为它房间编号更小。
>
>查询 [2,5] ：房间 3 是唯一面积大于等于 5 的，所以答案为 3 。

提示：

- n == rooms.length
- 1 <= n <= 105
- k == queries.length
- 1 <= k <= 104
- 1 <= roomIdi, preferredj <= 107
- 1 <= sizei, minSizej <= 107

---

```go
func closestRoom(rooms [][]int, queries [][]int) []int {
    
}
```

{{< togglecontent label="🧠思路:  👈点击" >}}

先将rooms排序,从大到小。例如我们找面积大于等于4的数组就不用全部遍历，而是有退出条件
遍历需求queries，如果符合条件就对比ID绝对值。

{{< /togglecontent >}}

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
const maxPreferred = 1_000_0000 + 1

func closestRoom(rooms [][]int, queries [][]int) []int {
    // 从大到小 排序
    slices.SortFunc(rooms, func(i, k []int) int { return k[1] - i[1] })

    n := len(queries)
    ans := make([]int, n)
    for ansI, q := range queries {
        // _ = q[0] // id
        // _ = q[1] // 最小面积

        minID := maxPreferred // 这里记录最小的ID差值

        for i := 0; i < len(rooms) && rooms[i][1] >= q[1]; i++ {
            // rooms[i][0] = 房间ID
            // rooms[i][1] = 房间面积
            idGap := abs(rooms[i][0] - q[0])
            if minID > idGap {
                minID = idGap
                ans[ansI] = rooms[i][0]
            } else if minID == idGap { // 如果差相同 选小的ID
                ans[ansI] = min(ans[ansI], rooms[i][0])
            }
        }
        if minID == maxPreferred {
            ans[ansI] = -1 // 默认为-1
        }
    }
    return ans
}
func abs(a int) int {
    if a < 0 {
        return -a
    }
    return a
}


```

{{< /togglecontent >}}
