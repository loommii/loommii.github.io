# 3488_距离最小相等元素查询


# LeetCode 3488. 距离最小相等元素查询

## 📝 题目描述

给你一个 **环形** 数组 `nums` 和一个数组 `queries` 。

对于每个查询 `i` ，你需要找到以下内容：

*   数组 `nums` 中下标 `queries[i]` 处的元素与 **任意** 其他下标 `j`（满足 `nums[j] == nums[queries[i]]`）之间的 **最小** 距离。如果不存在这样的下标 `j`，则该查询的结果为 `-1` 。

返回一个数组 `answer`，其大小与 `queries` 相同，其中 `answer[i]` 表示查询 `i` 的结果。

---

## 📥 示例

### 示例 1

**输入：**
```text
nums = [1,3,1,4,1,3,2], queries = [0,3,5]
```

**输出：**
```text
[2,-1,3]
```

**解释：**
*   查询 0：下标 `queries[0] = 0` 处的元素为 `nums[0] = 1` 。最近的相同值下标为 2，距离为 2。
*   查询 1：下标 `queries[1] = 3` 处的元素为 `nums[3] = 4` 。不存在其他包含值 4 的下标，因此结果为 -1。
*   查询 2：下标 `queries[2] = 5` 处的元素为 `nums[5] = 3` 。最近的相同值下标为 1，距离为 3（沿着循环路径：`5 -> 6 -> 0 -> 1`）。

### 示例 2

**输入：**
```text
nums = [1,2,3,4], queries = [0,1,2,3]
```

**输出：**
```text
[-1,-1,-1,-1]
```

**解释：**
数组 `nums` 中的每个值都是唯一的，因此没有下标与查询的元素值相同。所有查询的结果均为 -1。

---

## 📏 提示

*   `1 <= queries.length <= nums.length <= 10^5`
*   `1 <= nums[i] <= 10^6`
*   `0 <= queries[i] < nums.length`

---

## 💻 Go 模板

```go
import "sort"

func solveQueries(nums []int, queries []int) []int {
	n := len(nums)
	pos := make(map[int][]int)
	for i, x := range nums {
		pos[x] = append(pos[x], i)
	}

	ans := make([]int, len(queries))
	for i, q := range queries {
		x := nums[q]
		indices := pos[x]
		if len(indices) <= 1 {
			ans[i] = -1
			continue
		}

		// 在所有相同值的下标中，找到当前查询下标 q 的位置
		p := sort.SearchInts(indices, q)
		
		// 找到 q 在环形下标列表中的前一个邻居
		prevNeighbor := indices[(p-1+len(indices))%len(indices)]
		distPrev := abs(q - prevNeighbor)

		// 找到 q 在环形下标列表中的后一个邻居
		nextNeighbor := indices[(p+1)%len(indices)]
		distNext := abs(q - nextNeighbor)

		// 计算两个方向的环形距离，并取最小值
		minDist := min(min(distPrev, n - distPrev), min(distNext, n - distNext))
		ans[i] = minDist
	}
	return ans
}

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
```

---

## 🧪 测试用例

| # | nums | queries | 期望输出 |
|---|---|---|---|
| 1 | `[1,3,1,4,1,3,2]` | `[0,3,5]` | `[2,-1,3]` |
| 2 | `[1,2,3,4]` | `[0,1,2,3]` | `[-1,-1,-1,-1]` |

---

{{< details summary="🔑 答案解析： 👈点击" >}}
### 算法说明

这个问题的核心是在环形数组中为多个查询高效地找到具有相同值的最近元素的距离。一个高效的解法是结合**哈希表预处理**和**二分查找**。

1.  **预处理**：我们首先遍历一次 `nums` 数组，使用一个哈希表 `pos` 来存储每个数字出现的所有下标。`pos` 的键是 `nums` 中的数字，值是该数字出现的所有下标组成的列表。由于我们是按顺序遍历 `nums` 的，所以每个下标列表自然就是**有序的**。
    ```
    // 例如: nums = [1,3,1,4,1,3,2]
    // pos = {
    //   1: [0, 2, 4],
    //   3: [1, 5],
    //   4: [3],
    //   2: [6]
    // }
    ```

2.  **处理查询**：遍历 `queries` 中的每一个查询下标 `q`。
    - 获取该下标对应的值 `val = nums[q]`。
    - 从哈希表 `pos` 中取出 `val` 对应的所有下标列表 `indices`。
    - 如果 `indices` 的长度小于等于 1，意味着 `val` 在 `nums` 中只出现了一次或零次，不存在“其他”相同元素，因此当前查询结果为 `-1`。

3.  **定位与查找**：
    - 在有序的 `indices` 列表中，使用**二分查找**（`sort.SearchInts`）来定位 `q` 自身的位置。假设 `q` 在 `indices` 中的下标为 `p`。
    - `q` 的最近邻居只可能是在 `indices` 列表中与它相邻的两个元素：`indices[p-1]` (前驱) 和 `indices[p+1]` (后继)。
    - 因为 `indices` 列表本身也代表了一个环（第一个元素是最后一个元素的后继），所以我们可以通过取模运算 `(p-1+len)%len` 和 `(p+1)%len` 来轻松找到环形邻居。

4.  **计算最短距离**：
    - 对于 `q` 和它的两个邻居（`prevNeighbor`, `nextNeighbor`），我们需要计算它们之间的**环形距离**。
    - 在一个长度为 `n` 的环中，两个下标 `i` 和 `j` 之间的距离是 `min(|i-j|, n - |i-j|)`。这代表了顺时针和逆时针两个方向中较短的路径。
    - 我们分别计算 `q` 到 `prevNeighbor` 和 `q` 到 `nextNeighbor` 的环形距离，然后取这两者中更小的一个，即为最终答案。

通过这种“预处理+查询”的模式，我们可以高效地响应每一个查询，而不需要每次都重新遍历整个 `nums` 数组。

### 示例 1 演练 (`query = 5`)

- **输入**: `nums = [1,3,1,4,1,3,2]`, `queries = [0,3,5]`, `n=7`。
- **预处理**: `pos[3] = [1, 5]`。
- **查询**: `q = 5`，对应的值是 `nums[5] = 3`。
- **定位**: `indices = [1, 5]`。`q=5` 在 `indices` 中的位置 `p=1`。
- **找邻居**:
    - 前驱: `indices[(1-1+2)%2]` = `indices[0]` = `1`。
    - 后继: `indices[(1+1)%2]` = `indices[0]` = `1`。
    - 两个邻居都是 `1`。
- **算距离**:
    - 计算 `q=5` 和邻居 `1` 之间的距离。
    - 直接距离: `|5 - 1| = 4`。
    - 环形绕路距离: `n - |5 - 1| = 7 - 4 = 3`。
    - 最短距离为 `min(4, 3) = 3`。
- **结果**: `query=5` 的答案是 `3`。

---

## 🚀 完整可运行代码（Go）

> 复制以下代码到本地或在线 Go 环境中，直接运行即可验证结果。

```go
package main

import (
	"fmt"
	"reflect"
	"sort"
)

func main() {
	// 测试用例
	testCases := []struct {
		nums     []int
		queries  []int
		expected []int
	}{
		{
			[]int{1, 3, 1, 4, 1, 3, 2},
			[]int{0, 3, 5},
			[]int{2, -1, 3},
		},
		{
			[]int{1, 2, 3, 4},
			[]int{0, 1, 2, 3},
			[]int{-1, -1, -1, -1},
		},
	}

	for i, tc := range testCases {
		result := solveQueries(tc.nums, tc.queries)
		fmt.Printf("测试用例 %d: 期望输出 = %v, 实际输出 = %v, 通过 = %t
", i+1, tc.expected, result, reflect.DeepEqual(result, tc.expected))
	}
}

func solveQueries(nums []int, queries []int) []int {
	n := len(nums)
	pos := make(map[int][]int)
	for i, x := range nums {
		pos[x] = append(pos[x], i)
	}

	ans := make([]int, len(queries))
	for i, q := range queries {
		x := nums[q]
		indices := pos[x]
		if len(indices) <= 1 {
			ans[i] = -1
			continue
		}

		p := sort.SearchInts(indices, q)
		
		prevNeighbor := indices[(p-1+len(indices))%len(indices)]
		distPrev := abs(q - prevNeighbor)

		nextNeighbor := indices[(p+1)%len(indices)]
		distNext := abs(q - nextNeighbor)

		minDist := min(min(distPrev, n - distPrev), min(distNext, n - distNext))
		ans[i] = minDist
	}
	return ans
}

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}
```
{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3488_closest-equal-element-queries/  

