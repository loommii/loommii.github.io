# 1812_判断国际象棋棋盘中一个格子的颜色



```go
func squareIsWhite(coordinates string) bool {
    
}
```

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
func squareIsWhite(coordinates string) bool {
    return coordinates[0]%2 != coordinates[1]%2
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/1812_determine_color_of_a_chessboard_square/  

