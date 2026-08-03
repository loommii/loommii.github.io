# 3285_找到稳定山的下标



```go
func stableMountains(height []int, threshold int) []int {
    
}
```

---

{{< details summary="🔑 答案解析： 👈点击" >}}

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3285_find_the_index_of_the_stable_mountain/  

