# 3159_Find Occurrences of an Element in an Array



```go
func occurrencesOfElement(nums, queries []int, x int) []int {

}
```

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func occurrencesOfElement(nums, queries []int, x int) []int {
    queryLen := len(queries)
    ans := make([]int, queryLen)

    // Define a slice indexList to store all index positions of the target element x in the nums array.
    var indexList []int
    // Iterate over the nums array.
    for i, v := range nums {
        // If the current element v equals the target element x.
        if v == x {
            // Append the current element's index i to the indexList slice.
            indexList = append(indexList, i)
        }
    }

    // Iterate over the queries array.
    for i, v := range queries {
        // If the query value v is greater than the length of the indexList slice,
        // the queried position exceeds the number of occurrences of the target element x.
        if v > len(indexList) {
            // Store -1 at the corresponding position in the result array ans.
            ans[i] = -1
        } else {
            // Store the value at index v-1 of indexList into the result array ans.
            ans[i] = indexList[v-1]
        }
    }

    return ans
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3159_find_occurrences_of_an_element_in_an_array/  

