# 3159_查询数组中元素的出现位置



```go
func occurrencesOfElement(nums, queries []int, x int) []int {

}
```

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
func occurrencesOfElement(nums, queries []int, x int) []int {
    queryLen := len(queries)
    ans := make([]int, queryLen)

    // 定义一个切片 indexList，用于存储目标元素 x 在 nums 数组中的所有索引位置
    var indexList []int
    // 遍历 nums 数组
    for i, v := range nums {
        // 如果当前元素 v 等于目标元素 x
        if v == x {
            // 将当前元素的索引 i 添加到 indexList 切片中
            indexList = append(indexList, i)
        }
    }

    // 遍历查询数组 queries
    for i, v := range queries {
        // 如果查询值 v 大于 indexList 切片的长度，说明查询的位置超出了目标元素 x 出现的次数
        if v > len(indexList) {
            // 在结果数组 ans 的对应位置存入 -1
            ans[i] = -1
        } else {
            // 在结果数组 ans 的对应位置存入 indexList 中索引为 v-1 的值
            ans[i] = indexList[v-1]
        }
    }

    return ans
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3159_find_occurrences_of_an_element_in_an_array/  

