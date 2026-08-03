# 935. Knight Dialer


<!--more-->

## [935. Knight Dialer](https://leetcode.cn/problems/knight-dialer/)

The knight roams on an n x n chessboard. In a valid knight tour, the knight can start from a digit cell and then perform n - 1 moves, each of which must be a standard knight move: in an "L" shape, i.e., moving two cells in one direction and then one cell perpendicular, or moving one cell in one direction and then two cells perpendicular.

The knight can only stand on digit cells (i.e., blue cells).

Given an integer n, return the number of distinct phone numbers we can dial.

Since the answer may be very large, return the answer modulo 10^9 + 7.

**Example 1:**

> Input: n = 1
> Output: 10
> Explanation: We need to dial a number of length 1, so we can dial 0-9, 10 numbers in total.

**Example 2:**

> Input: n = 2
> Output: 20
> Explanation: All possible number sequences are: [04, 06, 16, 18, 27, 29, 34, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]

**Example 3:**

> Input: n = 3131
> Output: 136006598
> Explanation: Note that the output should be the result modulo 10^9 + 7.

**Constraints:**

- 1 <= n <= 5000

---

```go
func knightDialer(n int) int {

}
```

{{< details summary="🧠 Approach: 👈 Click to expand" >}}

Dynamic programming approach:
- Define the state: dp[i][j] represents the number of ways ending with digit j at step i
- State transition: for each digit j, find which digits it can be reached from
- Initial state: dp[0][j] = 1 (for all reachable digits j)

The knight's movement rules determine the positions each digit can jump to:
- 0 can jump to 4, 6
- 1 can jump to 6, 8
- 2 can jump to 7, 9
- 3 can jump to 4, 8
- 4 can jump to 0, 3, 9
- 5 cannot jump to any position
- 6 can jump to 0, 1, 7
- 7 can jump to 2, 6
- 8 can jump to 1, 3
- 9 can jump to 2, 4

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis:" >}}

```go
func knightDialer(n int) int {
    MOD := 1000000007
    
    // Define the positions each digit can jump to
    jumps := [][]int{
        {4, 6},       // 0
        {6, 8},       // 1
        {7, 9},       // 2
        {4, 8},       // 3
        {0, 3, 9},    // 4
        {},           // 5 (cannot jump to any position)
        {0, 1, 7},    // 6
        {2, 6},       // 7
        {1, 3},       // 8
        {2, 4},       // 9
    }
    
    // dp[i][j] represents the number of ways ending with digit j at step i
    prev := make([]int, 10)
    for i := 0; i < 10; i++ {
        prev[i] = 1
    }
    
    for step := 1; step < n; step++ {
        curr := make([]int, 10)
        for j := 0; j < 10; j++ {
            for _, next := range jumps[j] {
                curr[next] = (curr[next] + prev[j]) % MOD
            }
        }
        prev = curr
    }
    
    result := 0
    for i := 0; i < 10; i++ {
        result = (result + prev[i]) % MOD
    }
    
    return result
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/935_knight_dialer/  

