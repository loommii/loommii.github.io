# 3488. Closest Equal Element Queries


# LeetCode 3488. Closest Equal Element Queries

## 📝 Problem Description

You are given a **circular** array `nums` and an array `queries`.

For each query `i`, you need to find the following:

*   The **minimum** distance between the element at index `queries[i]` in the array `nums` and **any** other index `j` (where `nums[j] == nums[queries[i]]`). If no such index `j` exists, the result for that query is `-1`.

Return an array `answer` of the same size as `queries`, where `answer[i]` is the result for query `i`.

---

## 📥 Examples

### Example 1

**Input:**
```text
nums = [1,3,1,4,1,3,2], queries = [0,3,5]
```

**Output:**
```text
[2,-1,3]
```

**Explanation:**
*   Query 0: The element at index `queries[0] = 0` is `nums[0] = 1`. The closest index with the same value is 2, and the distance is 2.
*   Query 1: The element at index `queries[1] = 3` is `nums[3] = 4`. There are no other indices with the value 4, so the result is -1.
*   Query 2: The element at index `queries[2] = 5` is `nums[5] = 3`. The closest index with the same value is 1, and the distance is 3 (along the circular path: `5 -> 6 -> 0 -> 1`).

### Example 2

**Input:**
```text
nums = [1,2,3,4], queries = [0,1,2,3]
```

**Output:**
```text
[-1,-1,-1,-1]
```

**Explanation:**
Each value in the `nums` array is unique, so there are no other indices with the same value as the queried element. The result for all queries is -1.

---

## 📏 Constraints

*   `1 <= queries.length <= nums.length <= 10^5`
*   `1 <= nums[i] <= 10^6`
*   `0 <= queries[i] < nums.length`

---

## 💻 Go Template

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

		// Find the position of the current query index q in the list of same-value indices
		p := sort.SearchInts(indices, q)
		
		// Find the previous neighbor of q in the circular list of indices
		prevNeighbor := indices[(p-1+len(indices))%len(indices)]
		distPrev := abs(q - prevNeighbor)

		// Find the next neighbor of q in the circular list of indices
		nextNeighbor := indices[(p+1)%len(indices)]
		distNext := abs(q - nextNeighbor)

		// Calculate the circular distances in both directions and take the minimum
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

## 🧪 Test Cases

| # | nums | queries | Expected Output |
|---|---|---|---|
| 1 | `[1,3,1,4,1,3,2]` | `[0,3,5]` | `[2,-1,3]` |
| 2 | `[1,2,3,4]` | `[0,1,2,3]` | `[-1,-1,-1,-1]` |

---

{{< details summary="🔑 Solution Analysis: 👈Click" >}}
### Algorithm Explanation

The core of this problem is to efficiently find the minimum distance to the nearest element with the same value for multiple queries in a circular array. An efficient solution combines **hash table preprocessing** and **binary search**.

1.  **Preprocessing**: We first iterate through the `nums` array once, using a hash table `pos` to store all indices where each number appears. The keys of `pos` are the numbers in `nums`, and the values are lists of indices where that number appears. Since we iterate through `nums` in order, each list of indices will naturally be **sorted**.
    ```
    // Example: nums = [1,3,1,4,1,3,2]
    // pos = {
    //   1: [0, 2, 4],
    //   3: [1, 5],
    //   4: [3],
    //   2: [6]
    // }
    ```

2.  **Processing Queries**: Iterate through each query index `q` in `queries`.
    - Get the corresponding value `val = nums[q]`.
    - Retrieve the list of all indices `indices` for `val` from the hash table `pos`.
    - If the length of `indices` is 1 or less, it means `val` appears only once or not at all in `nums`. There is no "other" equal element, so the result for the current query is `-1`.

3.  **Locating and Searching**:
    - In the sorted `indices` list, use **binary search** (`sort.SearchInts`) to locate the position of `q` itself. Let's say the index of `q` within `indices` is `p`.
    - The nearest neighbors of `q` can only be the two elements adjacent to it in the `indices` list: `indices[p-1]` (predecessor) and `indices[p+1]` (successor).
    - Since the `indices` list also represents a circle (the first element is the successor of the last), we can easily find the circular neighbors using the modulo operator: `(p-1+len(indices))%len(indices)` and `(p+1)%len(indices)`.

4.  **Calculating the Shortest Distance**:
    - For `q` and its two neighbors (`prevNeighbor`, `nextNeighbor`), we need to calculate their **circular distance**.
    - In a circle of length `n`, the distance between two indices `i` and `j` is `min(abs(i-j), n - abs(i-j))`. This represents the shorter path in both clockwise and counter-clockwise directions.
    - We calculate the circular distance from `q` to `prevNeighbor` and from `q` to `nextNeighbor` separately, and then take the smaller of the two, which is our final answer.

With this "preprocess + query" pattern, we can respond to each query efficiently without having to re-iterate through the entire `nums` array every time.

### Example 1 Walkthrough (`query = 5`)

- **Input**: `nums = [1,3,1,4,1,3,2]`, `queries = [0,3,5]`, `n=7`.
- **Preprocessing**: `pos[3] = [1, 5]`.
- **Query**: `q = 5`, the corresponding value is `nums[5] = 3`.
- **Locating**: `indices = [1, 5]`. The position of `q=5` in `indices` is `p=1`.
- **Finding Neighbors**:
    - Predecessor: `indices[(1-1+2)%2]` = `indices[0]` = `1`.
    - Successor: `indices[(1+1)%2]` = `indices[0]` = `1`.
    - Both neighbors are `1`.
- **Calculating Distance**:
    - Calculate the distance between `q=5` and neighbor `1`.
    - Direct distance: `abs(5 - 1) = 4`.
    - Circular wrap-around distance: `n - abs(5 - 1) = 7 - 4 = 3`.
    - The shortest distance is `min(4, 3) = 3`.
- **Result**: The answer for `query=5` is `3`.

---

## 🚀 Complete Runnable Code (Go)

> Copy the code below into a local or online Go environment to run and verify the results.

```go
package main

import (
	"fmt"
	"reflect"
	"sort"
)

func main() {
	// Test Cases
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
		fmt.Printf("Test Case %d: Expected = %v, Got = %v, Passed = %t
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3488_closest-equal-element-queries/  

