# 3285_Find the Index of the Stable Mountain



```go
func stableMountains(height []int, threshold int) []int {
    
}
```

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func stableMountains(height []int, threshold int) []int {
    ans := make([]int, 0)
    for i := 0; i < len(height)-1; i++ {
        if height[i] > threshold {
            ans = append(ans, i+1)
        }
    }
    return ans
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3285_find_the_index_of_the_stable_mountain/  

