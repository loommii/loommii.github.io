# 3046_Split the Array



```go
func isPossibleToSplit(nums []int) bool {
    
}
```

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func isPossibleToSplit(nums []int) bool {
    cnt := make(map[int]int)
    for _, v := range nums {
        cnt[v]++
        if cnt[v] > 2 {
            return false
        }
    }
    return true
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3046_split_the_array/  

