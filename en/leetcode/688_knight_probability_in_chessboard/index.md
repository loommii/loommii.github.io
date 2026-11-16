# 688. Knight Probability in Chessboard


<!--more-->

## [688. Knight Probability in Chessboard](https://leetcode.cn/problems/knight-probability-in-chessboard/)

On an n x n chessboard, a knight starts at [row, column] and attempts to make exactly k moves. The rows and columns are 0-indexed, so the top-left cell is (0, 0) and the bottom-right cell is (n - 1, n - 1). For each move, the knight randomly chooses one of the 8 possible moves (even if it would leave the board). Return the probability that the knight is still on the board after k moves.

**Example 1:**

> Input: n = 3, k = 2, row = 0, column = 0
> Output: 0.0625
> Explanation: There are two moves (to (1, 2), (2, 1)) that keep the knight on the board. From those positions, there are two moves that lead back onto the board, so the total probability of staying on the board is 0.0625.

**Example 2:**

> Input: n = 1, k = 0, row = 0, column = 0
> Output: 1.00000

**Constraints:**

- 1 <= n <= 25
- 0 <= k <= 100
- 0 <= row, column <= n - 1

---

```go
func knightProbability(n int, k int, row int, column int) float64 {

}
```

{{< details summary="🧠 Approach: 👈 Click to expand" >}}

Subproblem.
In Example 1, the problem we need to solve (the original problem) is:
the probability that a knight starting at (0, 0) is still on the board after k=2 moves.
Enumerate the eight directions the knight can move. Suppose it moves to (1, 2); the problem then becomes:
the probability that a knight starting at (1, 2) is still on the board after k−1=1 moves.
This is a smaller subproblem similar to the original problem, which can be solved recursively.

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis:" >}}

```go
func knightProbability(n int, k int, row int, column int) float64 {
    // dp[i][j][step] represents the probability of being on the board after step moves from position (i, j)
    // Since it only depends on the previous step, a rolling array can be used to optimize
    dirs := [][]int{{-2, -1}, {-2, 1}, {-1, -2}, {-1, 2}, {1, -2}, {1, 2}, {2, -1}, {2, 1}}
    
    // Initialize the dp array
    prev := make([][]float64, n)
    for i := range prev {
        prev[i] = make([]float64, n)
        for j := range prev[i] {
            prev[i][j] = 1.0
        }
    }
    
    for step := 0; step < k; step++ {
        curr := make([][]float64, n)
        for i := range curr {
            curr[i] = make([]float64, n)
        }
        
        for i := 0; i < n; i++ {
            for j := 0; j < n; j++ {
                for _, dir := range dirs {
                    ni, nj := i+dir[0], j+dir[1]
                    if ni >= 0 && ni < n && nj >= 0 && nj < n {
                        curr[i][j] += prev[ni][nj] / 8.0
                    }
                }
            }
        }
        prev = curr
    }
    
    return prev[row][column]
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/688_knight_probability_in_chessboard/  

