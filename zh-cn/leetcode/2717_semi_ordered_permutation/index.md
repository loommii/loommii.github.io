# 2717. 半有序排列


<!--more-->

## [2717. 半有序排列](https://leetcode.cn/problems/semi-ordered-permutation/)

给你一个下标从 1 开始、长度为 n 的排列 `nums`。这表示数字从 1 到 n，分别对应下标从 0 到 n-1。

我们需要使排列变为**半有序排列**，即第一位是 1，最后一位是 n。

除了交换相邻元素外，我们还可以**任意次数**地反转排列的前缀。

返回使排列变为半有序排列所需的最少操作数。

操作定义如下：

- 交换相邻元素：选择 i，交换 `nums[i]` 和 `nums[i+1]`
- 反转前缀：选择 i，反转 `nums[0..i]`

**示例 1：**

> 输入：nums = [2,1,4,3]
> 输出：2
> 解释：我们可以执行以下操作：
> 1. 交换 i=0 和 i=1 对应的元素，得到 [1,2,4,3]。
> 2. 交换 i=2 和 i=3 对应的元素，得到 [1,2,3,4]。

**示例 2：**

> 输入：nums = [2,4,1,3]
> 输出：3
> 解释：
> 1. 交换 i=1 和 i=2，得到 [2,1,4,3]。
> 2. 交换 i=0 和 i=1，得到 [1,2,4,3]。
> 3. 交换 i=2 和 i=3，得到 [1,2,3,4]。

**示例 3：**

> 输入：nums = [1,3,4,2,5]
> 输出：0
> 解释：数组已经是一个半有序排列。

**提示：**

- 2 <= nums.length == n <= 50
- 1 <= nums[i] <= n
- nums 是一个排列

---

```go
func semiOrderedPermutation(nums []int) int {

}
```

{{< details summary="🧠思路: 👈点击" >}}

遍历一遍记录最小和最大值对应的下标
假设最小值为1的位置是j，则需要移动j次
最大值n的位置是k，则需要移动n-1-k次
存在一种特殊情况，当最小值的下标比最大值的下标大时。移动最小值时会带动最大值，因此次数会少1

{{< /details >}}

---

{{< details summary="🔑 答案解析：" >}}

```go
func semiOrderedPermutation(nums []int) int {
    n := len(nums)
    minIdx, maxIdx := -1, -1
    
    // 找到最小值(1)和最大值(n)的索引
    for i, v := range nums {
        if v == 1 {
            minIdx = i
        }
        if v == n {
            maxIdx = i
        }
    }
    
    // 计算移动次数
    moves := minIdx  // 将1移动到开头需要的次数
    moves += (n - 1 - maxIdx)  // 将n移动到末尾需要的次数
    
    // 如果1的位置在n之后，那么在移动1的过程中会顺便移动n，所以减少1次
    if minIdx > maxIdx {
        moves--
    }
    
    return moves
}
```

{{< /details >}}

---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/2717_semi_ordered_permutation/  

