# 1847_最近的房间



```go
func closestRoom(rooms [][]int, queries [][]int) []int {
    
}
```

{{< details summary="🧠思路:  👈点击" >}}

先将rooms排序,从大到小。例如我们找面积大于等于4的数组就不用全部遍历，而是有退出条件
遍历需求queries，如果符合条件就对比ID绝对值。

{{< /details >}}

{{< details summary="🔑 答案解析： 👈点击" >}}

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

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1847_closest_room/  

