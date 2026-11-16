# 2545_根据第K场考试的分数排序



```go
func sortTheStudents(score [][]int, k int) [][]int {
    
}
```

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
func sortTheStudents(score [][]int, k int) [][]int {
    slices.SortFunc(score, func(a, b []int) int { return b[k] - a[k] })
    return score
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/2545_sort_the_students_by_their_kth_score/  

