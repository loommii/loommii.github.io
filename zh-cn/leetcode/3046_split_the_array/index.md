# 3046_分割数组



```go
func isPossibleToSplit(nums []int) bool {
    
}
```

{{< details summary="🔑 答案解析： 👈点击" >}}

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3046_split_the_array/  

