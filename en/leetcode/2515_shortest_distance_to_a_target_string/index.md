# 2515_Shortest Distance to a Target String


# LeetCode 2515. Shortest Distance to a Target String

## 📝 Problem Description

You are given a **0-indexed** **circular** string array `words` and a string `target`. A **circular array** means that the last element of `words` is adjacent to the first element.

You can move from `words[i]` to `words[j]` either clockwise or counter-clockwise.

Return *the shortest distance from `startIndex` to `target`*. If `target` is not in `words`, return `-1`.

---

## 📥 Examples

### Example 1

**Input:**
```text
words = ["hello","i","am","leetcode","hello"], target = "hello", startIndex = 1
```

**Output:**
```text
1
```

**Explanation:**
Starting from index 1, we can move to index 4 or index 0.
- Moving to index 4 requires 3 steps clockwise.
- Moving to index 0 requires 1 step counter-clockwise (utilizing the circular property).

The shortest distance is 1.

### Example 2

**Input:**
```text
words = ["a","b","leetcode"], target = "leetcode", startIndex = 0
```

**Output:**
```text
1
```

**Explanation:**
Starting from index 0, moving 1 step counter-clockwise to index 2 (where "leetcode" is) gives a distance of 1.

### Example 3

**Input:**
```text
words = ["i","eat","leetcode"], target = "ate", startIndex = 0
```

**Output:**
```text
-1
```

**Explanation:**
"ate" is not in the `words` array, so we return -1.

---

## 📏 Constraints

- `1 <= words.length <= 100`
- `1 <= words[i].length <= 100`
- `words[i]` and `target` consist of only lowercase English letters.
- `0 <= startIndex < words.length`

---

## 💻 Go Template

```go
func closestTarget(words []string, target string, startIndex int) int {
	n := len(words)
	// The search radius `dist` starts from 0.
	// We only need to search up to half the array's length,
	// as any longer path has a shorter counterpart in the other direction.
	for dist := 0; dist <= n/2; dist++ {
		// Calculate the index `dist` steps to the right (clockwise).
		rightIndex := (startIndex + dist) % n
		// Calculate the index `dist` steps to the left (counter-clockwise).
		leftIndex := (startIndex - dist + n) % n
		
		// If the target is found at either index, we've found the shortest path.
		if words[rightIndex] == target || words[leftIndex] == target {
			return dist
		}
	}
	// If the loop completes and the target is not found, return -1.
	return -1
}
```

---

## 🧪 Test Cases

| # | words | target | startIndex | Expected Output |
|---|-------|--------|------------|-----------------|
| 1 | `["hello","i","am","leetcode","hello"]` | `"hello"` | `1` | `1` |
| 2 | `["a","b","leetcode"]` | `"leetcode"` | `0` | `1` |
| 3 | `["i","eat","leetcode"]` | `"ate"` | `0` | `-1` |

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}
### Algorithm Explanation

The core of this problem is finding the shortest distance within a circular array. An intuitive and efficient approach is a **bidirectional expanding search**.

1.  **Start from `startIndex`**: Our search begins at the `startIndex`, rather than iterating through the entire array. This is more direct.
2.  **Synchronous Expansion**: We simulate a gradually expanding search "radius" (`dist`). In each step, we check the positions at the same distance both clockwise (right) and counter-clockwise (left). At a distance `dist`, we check indices `startIndex + dist` and `startIndex - dist`, being careful to handle the circular wrapping.
3.  **Stop When Found**: Since we search from nearest to farthest (i.e., `dist` increases from 0), the first time we find the `target`, the corresponding distance is guaranteed to be the shortest. We can return the result immediately.
4.  **Key Optimization**: In a circular array of length `n`, the shortest distance between any two points will not exceed `n / 2`. If the distance in one direction, `d`, is greater than `n / 2`, the distance in the opposite direction, `n - d`, will necessarily be less than `n / 2`. Therefore, our search radius only needs to expand up to `n / 2`, which avoids a redundant full traversal.

### Example 1 Walkthrough

Let's walk through the process with `words = ["hello","i","am","leetcode","hello"]`, `target = "hello"`, `startIndex = 1`.

- **Initialization**: `n = 5`, `startIndex = 1`. The search radius `dist` will iterate from 0 up to `5 / 2 = 2`.

- **`dist = 0`**:
    - Clockwise 0 steps: `rightIndex = (1 + 0) % 5 = 1`. `words[1]` is `"i"`.
    - Counter-clockwise 0 steps: `leftIndex = (1 - 0 + 5) % 5 = 1`. `words[1]` is `"i"`.
    - `"i"` is not `"hello"`, so we continue.

- **`dist = 1`**:
    - Clockwise 1 step: `rightIndex = (1 + 1) % 5 = 2`. `words[2]` is `"am"`.
    - Counter-clockwise 1 step: `leftIndex = (1 - 1 + 5) % 5 = 0`. `words[0]` is `"hello"`.
    - **Target found!** `words[leftIndex]` matches the `target`.
    - The function immediately returns the current `dist`, which is **`1`**.

The algorithm terminates. The shortest distance is 1.
{{< /details >}}

---

## 🚀 Full Runnable Code (Go)

> Copy the following code into your local or online Go environment. The `closestTarget` function is already filled in, so you can run it directly to verify the results.

```go
package main

import "fmt"

func main() {
	// Test Case 1
	result1 := closestTarget([]string{"hello", "i", "am", "leetcode", "hello"}, "hello", 1)
	fmt.Printf("Test Case 1: Expected = 1, Got = %d, Passed = %t
", result1, result1 == 1)

	// Test Case 2
	result2 := closestTarget([]string{"a", "b", "leetcode"}, "leetcode", 0)
	fmt.Printf("Test Case 2: Expected = 1, Got = %d, Passed = %t
", result2, result2 == 1)

	// Test Case 3
	result3 := closestTarget([]string{"i", "eat", "leetcode"}, "ate", 0)
	fmt.Printf("Test Case 3: Expected = -1, Got = %d, Passed = %t
", result3, result3 == -1)
}

func closestTarget(words []string, target string, startIndex int) int {
	n := len(words)
	// The search radius `dist` starts from 0.
	// We only need to search up to half the array's length (n/2),
	// as any longer path has a shorter counterpart in the other direction.
	for dist := 0; dist <= n/2; dist++ {
		// Calculate the index `dist` steps to the right (clockwise).
		rightIndex := (startIndex + dist) % n
		// Calculate the index `dist` steps to the left (counter-clockwise).
		// Adding `n` ensures the result of the subtraction is non-negative before the modulo.
		leftIndex := (startIndex - dist + n) % n
		
		// If the target is found at either index, we've found the shortest path.
		if words[rightIndex] == target || words[leftIndex] == target {
			return dist
		}
	}
	// If the loop completes and the target is not found, return -1.
	return -1
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/2515_shortest_distance_to_a_target_string/  

