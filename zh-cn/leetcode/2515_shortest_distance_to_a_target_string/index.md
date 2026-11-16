# 2515_到目标字符串的最短距离


# LeetCode 2515. 到目标字符串的最短距离

## 📝 题目描述

给你一个下标从 `0` 开始的 **循环** 字符串数组 `words` 和一个字符串 `target`。

**循环** 数组意味着 `words` 的最后一个元素和第一个元素是相邻的。

要从 `words[i]` 到 `words[j]`，你可以从 `i` 向右或向左移动。

返回从 `words[startIndex]` 到 `target` 的最短距离。如果 `target` 不在 `words` 中，返回 `-1`。

---

## 📥 示例

### 示例 1

**输入：**
```text
words = ["hello","i","am","leetcode","hello"], target = "hello", startIndex = 1
```

**输出：**
```text
1
```

**解释：**
从索引 `1` 开始，我们可以移动到索引 `4` 或索引 `0`。
- 移动到索引 `4` 需要向右走 `3` 步。
- 移动到索引 `0` 需要向左走 `1` 步（利用循环特性）。

最短距离是 `1`。

### 示例 2

**输入：**
```text
words = ["a","b","leetcode"], target = "leetcode", startIndex = 0
```

**输出：**
```text
1
```

**解释：**
从索引 `0` 开始，向左移动 `1` 步即可到达索引 `2`（即 `"leetcode"`）。距离为 `1`。

### 示例 3

**输入：**
```text
words = ["i","eat","leetcode"], target = "ate", startIndex = 0
```

**输出：**
```text
-1
```

**解释：**
`"ate"` 不在 `words` 数组中，因此返回 `-1`。

---

## 📏 提示

- `1 <= words.length <= 100`
- `1 <= words[i].length <= 100`
- `words[i]` 和 `target` 仅由小写英文字母组成
- `0 <= startIndex < words.length`

---

## 💻 Go 模板

```go
func closestTarget(words []string, target string, startIndex int) int {
	n := len(words)
	// 搜索半径 ans 从 0 开始。
	// 我们只需要搜索到数组长度的一半，因为任何更长的路径在另一个方向上都有更短的对应路径。
	for ans := 0; ans < n/2+1; ans++ {
		// 计算向右（顺时针）移动 ans 步的索引
		rightIndex := (startIndex + ans) % n
		// 计算向左（逆时针）移动 ans 步的索引
		leftIndex := (startIndex - ans + n) % n
		
		// 如果在任一索引处找到目标，我们就找到了最短路径。
		if words[rightIndex] == target || words[leftIndex] == target {
			return ans
		}
	}
	// 如果循环完成仍未找到目标，则返回 -1。
	return -1
}
```

---

## 🧪 测试用例

| # | words | target | startIndex | 期望输出 |
|---|-------|--------|------------|----------|
| 1 | `["hello","i","am","leetcode","hello"]` | `"hello"` | `1` | `1` |
| 2 | `["a","b","leetcode"]` | `"leetcode"` | `0` | `1` |
| 3 | `["i","eat","leetcode"]` | `"ate"` | `0` | `-1` |

---

{{< details summary="🔑 答案解析： 👈点击" >}}
### 算法说明

这个问题的核心是“在循环数组中寻找最短距离”。一个直观且高效的思路是**双向扩展搜索**。

1.  **从起点开始**：我们的搜索从 `startIndex` 开始，而不是遍历整个数组。
2.  **同步扩展**：我们模拟一个逐渐扩大的搜索“半径”。在每一步中，我们同时检查向左和向右相同距离的位置。
    *   距离为 `d` 时，检查 `startIndex + d` 和 `startIndex - d` 的位置（注意处理循环边界）。
3.  **找到即停**：因为我们是从近到远（距离从小到大）进行搜索的，所以第一次找到 `target` 时，其对应的距离必然是最短的。此时可以直接返回结果。
4.  **关键优化**：在长度为 `n` 的循环数组中，任意两点之间的最短距离不会超过 `n / 2`。如果一个方向的距离 `d` 大于 `n / 2`，那么反方向的距离 `n - d` 必然小于 `n / 2`。因此，我们的搜索半径只需要扩展到 `n / 2` 即可，无需完整遍历。

### 示例 1 演练

让我们用 `words = ["hello","i","am","leetcode","hello"]`, `target = "hello"`, `startIndex = 1` 来详细走一遍流程。

- **初始化**: `n = 5`, `startIndex = 1`。搜索半径 `ans` 将从 `0` 遍历到 `5 / 2 = 2`。

- **`ans = 0`**:
    - 向右 `0` 步: `rightIndex = (1 + 0) % 5 = 1`。`words[1]` 是 `"i"`。
    - 向左 `0` 步: `leftIndex = (1 - 0 + 5) % 5 = 1`。`words[1]` 是 `"i"`。
    - `"i"` 不是 `"hello"`，继续。

- **`ans = 1`**:
    - 向右 `1` 步: `rightIndex = (1 + 1) % 5 = 2`。`words[2]` 是 `"am"`。
    - 向左 `1` 步: `leftIndex = (1 - 1 + 5) % 5 = 0`。`words[0]` 是 `"hello"`。
    - **找到目标！** `words[leftIndex]` 等于 `target`。
    - 函数立即返回当前的 `ans` 值，即 **`1`**。

算法结束，最短距离为 `1`。

---

## 🚀 完整可运行代码（Go）

> 复制以下代码到本地或在线 Go 环境中，填写 `closestTarget` 函数后直接运行即可验证结果。

```go
package main

import "fmt"

func main() {
	// 测试用例 1
	result1 := closestTarget([]string{"hello", "i", "am", "leetcode", "hello"}, "hello", 1)
	fmt.Printf("测试用例 1: 期望输出 = 1, 实际输出 = %d, 通过 = %t
", result1, result1 == 1)

	// 测试用例 2
	result2 := closestTarget([]string{"a", "b", "leetcode"}, "leetcode", 0)
	fmt.Printf("测试用例 2: 期望输出 = 1, 实际输出 = %d, 通过 = %t
", result2, result2 == 1)

	// 测试用例 3
	result3 := closestTarget([]string{"i", "eat", "leetcode"}, "ate", 0)
	fmt.Printf("测试用例 3: 期望输出 = -1, 实际输出 = %d, 通过 = %t
", result3, result3 == -1)
}

func closestTarget(words []string, target string, startIndex int) int {
	n := len(words)
	// 搜索半径 ans 从 0 开始。
	// 我们只需要搜索到数组长度的一半，因为任何更长的路径在另一个方向上都有更短的对应路径。
	for ans := 0; ans < n/2+1; ans++ {
		// 计算向右（顺时针）移动 ans 步的索引
		rightIndex := (startIndex + ans) % n
		// 计算向左（逆时针）移动 ans 步的索引
		leftIndex := (startIndex - ans + n) % n
		
		// 如果在任一索引处找到目标，我们就找到了最短路径。
		if words[rightIndex] == target || words[leftIndex] == target {
			return ans
		}
	}
	// 如果循环完成仍未找到目标，则返回 -1。
	return -1
}
```
{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/2515_shortest_distance_to_a_target_string/  

