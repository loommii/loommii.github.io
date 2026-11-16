# 688. 骑士在棋盘上的概率


<!--more-->

## [688. 骑士在棋盘上的概率](https://leetcode.cn/problems/knight-probability-in-chessboard/)

在一个 n x n 的棋盘中，一个骑士从 [row, column] 开始，并尝试进行 k 次移动。行和列是从 0 开始的，所以左上角是 (0,0)，右下角是 (n-1, n-1)。每次移动，骑士随机从 8 种可能的移动中选择一种（即使会导致离开棋盘）。返回骑士在走了 k 步后仍在棋盘上的概率。

**示例 1：**

> 输入: n = 3, k = 2, row = 0, column = 0
> 输出: 0.0625
> 解释: 有两步(到(1,2),(2,1))可以让骑士留在棋盘上。在这些位置上，有两步可以回到棋盘上，所以总的留在棋盘上的概率是 0.0625。

**示例 2：**

> 输入: n = 1, k = 0, row = 0, column = 0
> 输出: 1.00000

**提示：**

- 1 <= n <= 25
- 0 <= k <= 100
- 0 <= row, column <= n - 1

---

```go
func knightProbability(n int, k int, row int, column int) float64 {

}
```

{{< details summary="🧠思路: 👈点击" >}}

子问题.
在示例 1 中，我们要解决的问题（原问题）是：
马从 (0,0) 出发，走 k=2 步后仍然在棋盘上的概率。
枚举马走的八个方向，假设走到了 (1,2)，问题变成：
马从 (1,2) 出发，走 k−1=1 步后仍然在棋盘上的概率。
这是和原问题相似的、规模更小的子问题，可以用递归解决。

{{< /details >}}

---

{{< details summary="🔑 答案解析：" >}}

```go
func knightProbability(n int, k int, row int, column int) float64 {
    // dp[i][j][step] 表示在位置 (i,j) 走了 step 步后仍在棋盘上的概率
    // 由于只依赖于上一步，可以使用滚动数组优化
    dirs := [][]int{{-2, -1}, {-2, 1}, {-1, -2}, {-1, 2}, {1, -2}, {1, 2}, {2, -1}, {2, 1}}
    
    // 初始化 dp 数组
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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/688_knight_probability_in_chessboard/  

