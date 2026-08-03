# Go Daily Question 084


What is the output of the following code? Why?

```go
func main() {
    s1 := []int{1, 2, 3}
    s2 := s1[1:]
    s2[1] = 4
    fmt.Println(s1)
    s2 = append(s2, 5, 6, 7)
    fmt.Println(s1)
}

```

{{< details summary="🔑 Answer Analysis:" >}}

s1 [1,2,4]
s2 [2,4,5,6,7]

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_084/  

