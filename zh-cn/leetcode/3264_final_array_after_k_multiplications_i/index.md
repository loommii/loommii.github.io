# 3264_K_次乘运算后的最终数组_I



{{< details summary="🧠思路:  👈点击" >}}

遍历nums找最小

{{< /details >}}

---

{{< details summary="🔑 答案解析： 👈点击" >}}

### 遍历

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3264_final_array_after_k_multiplications_i/  

