# 1812_Determine Color of a Chessboard Square



```go
func squareIsWhite(coordinates string) bool {
    
}
```

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func squareIsWhite(coordinates string) bool {
    return coordinates[0]%2 != coordinates[1]%2
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/1812_determine_color_of_a_chessboard_square/  

