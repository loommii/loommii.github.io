# 209. 长度最小的子数组


<!--more-->

## [209. 长度最小的子数组](https://leetcode.cn/problems/minimum-size-subarray-sum/)

给定一个含有 `n` 个正整数的数组和一个正整数 `target` 。

找出该数组中满足其总和大于等于 `target` 的长度最小的连续子数组，并返回其长度。如果不存在符合条件的子数组，返回 `0` 。

**示例 1：**

> 输入：target = 7, nums = [2,3,1,2,4,3]
> 输出：2
> 解释：子数组 [4,3] 是该条件下的长度最小的子数组。

**示例 2：**

> 输入：target = 4, nums = [1,4,4]
> 输出：1

**示例 3：**

> 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
> 输出：0

**提示：**

- 1 <= target <= 10^9
- 1 <= nums.length <= 10^5
- 1 <= nums[i] <= 10^5

**进阶：**

如果你已经实现 O(n) 时间复杂度的解法，请尝试设计一个 O(n log(n)) 时间复杂度的解法。

---

```go
func minSubArrayLen(target int, nums []int) int {

}
```

{{< details summary="👉 解答：" >}}

```go
func minSubArrayLen(target int, nums []int) int {
    n := len(nums)
    ans := n + 1
    s := 0
    i := 0
    for j := 0; j < n; j++ {
        s += nums[j]
        for s >= target {
            if ans > j-i+1 {
                ans = j - i + 1
            }
            s -= nums[i]
            i++
        }
    }
    if ans == n+1 {
        return 0
    }
    return ans
}
```

{{< /details >}}

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/209_minimum_size_subarray_sum/  

