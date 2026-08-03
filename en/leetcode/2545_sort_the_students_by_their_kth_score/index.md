# 2545_Sort the Students by Their Kth Score



```go
func sortTheStudents(score [][]int, k int) [][]int {
    
}
```

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func sortTheStudents(score [][]int, k int) [][]int {
    slices.SortFunc(score, func(a, b []int) int { return b[k] - a[k] })
    return score
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/2545_sort_the_students_by_their_kth_score/  

