# 200. 岛屿数量



```go
func numIslands(grid [][]byte) int {

}
```

{{< details summary="👈点击" >}}

```go
func numIslands(grid [][]byte) (ans int) {
    var (
        m   = len(grid)
        n   = len(grid[0])
        dir = [][]int{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
        dfs func(i, j int)
    )
    dfs = func(i, j int) {
        if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] == '0' {
            return
        }
        grid[i][j] = '0'
        for _, v := range dir {
            dfs(i+v[0], j+v[1])
        }
    }
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == '1' {
                ans++
                dfs(i, j)
            }
        }
    }
    return
}
```

{{< /details >}}

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/200_number_of_islands/  

