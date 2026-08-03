# 209. Minimum Size Subarray Sum


<!--more-->

## [209. Minimum Size Subarray Sum](https://leetcode.cn/problems/minimum-size-subarray-sum/)

Given an array of `n` positive integers and a positive integer `target`.

Find the minimal length of a contiguous subarray whose sum is greater than or equal to `target` and return its length. If there is no such subarray, return `0`.

**Example 1:**

> Input: target = 7, nums = [2,3,1,2,4,3]
> Output: 2
> Explanation: The subarray [4,3] is the minimal length subarray under this condition.

**Example 2:**

> Input: target = 4, nums = [1,4,4]
> Output: 1

**Example 3:**

> Input: target = 11, nums = [1,1,1,1,1,1,1,1]
> Output: 0

**Constraints:**

- 1 <= target <= 10^9
- 1 <= nums.length <= 10^5
- 1 <= nums[i] <= 10^5

**Follow-up:**

If you have already implemented a solution with O(n) time complexity, try designing a solution with O(n log(n)) time complexity.

---

```go
func minSubArrayLen(target int, nums []int) int {

}
```

{{< details summary="👉 Solution:" >}}

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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/209_minimum_size_subarray_sum/  

