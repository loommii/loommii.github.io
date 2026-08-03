# 2717. Semi-Ordered Permutation


<!--more-->

## [2717. Semi-Ordered Permutation](https://leetcode.cn/problems/semi-ordered-permutation/)

You are given a 1-indexed permutation `nums` of length n. This means the numbers from 1 to n correspond to indices from 0 to n-1.

We need to make the permutation into a **semi-ordered permutation**, where the first element is 1 and the last element is n.

In addition to swapping adjacent elements, we can also **any number of times** reverse a prefix of the permutation.

Return the minimum number of operations required to make the permutation semi-ordered.

Operations are defined as follows:

- Swap adjacent elements: choose i, swap `nums[i]` and `nums[i+1]`
- Reverse a prefix: choose i, reverse `nums[0..i]`

**Example 1:**

> Input: nums = [2,1,4,3]
> Output: 2
> Explanation: We can perform the following operations:
> 1. Swap the elements at i=0 and i=1, resulting in [1,2,4,3].
> 2. Swap the elements at i=2 and i=3, resulting in [1,2,3,4].

**Example 2:**

> Input: nums = [2,4,1,3]
> Output: 3
> Explanation:
> 1. Swap i=1 and i=2, resulting in [2,1,4,3].
> 2. Swap i=0 and i=1, resulting in [1,2,4,3].
> 3. Swap i=2 and i=3, resulting in [1,2,3,4].

**Example 3:**

> Input: nums = [1,3,4,2,5]
> Output: 0
> Explanation: The array is already a semi-ordered permutation.

**Constraints:**

- 2 <= nums.length == n <= 50
- 1 <= nums[i] <= n
- nums is a permutation

---

```go
func semiOrderedPermutation(nums []int) int {

}
```

{{< details summary="🧠 Approach: 👈 Click to expand" >}}

Traverse the array once and record the indices of the minimum and maximum values.
Suppose the position of the minimum value 1 is j, then it needs j moves.
The position of the maximum value n is k, then it needs n-1-k moves.
There is a special case: when the index of the minimum value is greater than the index of the maximum value, moving the minimum value will also move the maximum value, so the count is reduced by 1.

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis:" >}}

```go
func semiOrderedPermutation(nums []int) int {
    n := len(nums)
    minIdx, maxIdx := -1, -1
    
    // Find the indices of the minimum (1) and maximum (n)
    for i, v := range nums {
        if v == 1 {
            minIdx = i
        }
        if v == n {
            maxIdx = i
        }
    }
    
    // Calculate the number of moves
    moves := minIdx  // moves needed to move 1 to the front
    moves += (n - 1 - maxIdx)  // moves needed to move n to the end
    
    // If the position of 1 is after n, moving 1 will also move n along the way, so subtract 1
    if minIdx > maxIdx {
        moves--
    }
    
    return moves
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/2717_semi_ordered_permutation/  

