# 3264_Final Array State After K Multiplication Operations I



{{< details summary="🧠 Ideas: 👈 Click to expand" >}}

Traverse nums to find the minimum.

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

### Traversal

```go
func getFinalState(nums []int, k int, multiplier int) []int {
    n := len(nums)
    for i := 0; i < k; i++ {
        minI := 0
        for j := 1; j < n; j++ {
            if nums[j] < nums[minI] {
                minI = j
            }
        }
        nums[minI] *= multiplier
    }
    return nums
}

```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3264_final_array_after_k_multiplications_i/  

