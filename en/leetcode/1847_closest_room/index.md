# 1847_Closest Room



```go
func closestRoom(rooms [][]int, queries [][]int) []int {
    
}
```

{{< details summary="🧠 Idea: 👈 Click to expand" >}}

First sort rooms in descending order. For example, when looking for rooms with an area greater than or equal to 4, we don't need to traverse the entire array; there is an exit condition.
Traverse the queries; if a room meets the condition, compare the absolute difference of IDs.

{{< /details >}}

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
const maxPreferred = 1_000_0000 + 1

func closestRoom(rooms [][]int, queries [][]int) []int {
    // Sort in descending order
    slices.SortFunc(rooms, func(i, k []int) int { return k[1] - i[1] })

    n := len(queries)
    ans := make([]int, n)
    for ansI, q := range queries {
        // _ = q[0] // id
        // _ = q[1] // minimum area

        minID := maxPreferred // Record the minimum ID gap here

        for i := 0; i < len(rooms) && rooms[i][1] >= q[1]; i++ {
            // rooms[i][0] = room ID
            // rooms[i][1] = room area
            idGap := abs(rooms[i][0] - q[0])
            if minID > idGap {
                minID = idGap
                ans[ansI] = rooms[i][0]
            } else if minID == idGap { // If the gap is the same, choose the smaller ID
                ans[ansI] = min(ans[ansI], rooms[i][0])
            }
        }
        if minID == maxPreferred {
            ans[ansI] = -1 // Default to -1
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1847_closest_room/  

