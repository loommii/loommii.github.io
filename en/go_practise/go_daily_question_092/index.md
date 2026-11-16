# Go Daily Question 092


What is the output of the following code? Why?

```go
type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func main() {

    var s *Student
    if s == nil {
        fmt.Println("s is nil")
    } else {
        fmt.Println("s is not nil")
    }
    var p People = s
    if p == nil {
        fmt.Println("p is nil")
    } else {
        fmt.Println("p is not nil")
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Reference answer and explanation: "s is nil" and "p is not nil".

This question might be a bit surprising. The value we assigned to variable `p` is seemingly `nil`, yet `p` is not `nil`. Remember: an interface type value is `nil` if and only if both its dynamic value and dynamic type are `nil`. In the code above, after assigning `s` to `p`, the dynamic value of `p` is `nil`, but its dynamic type is `*Student`, which is a `nil` pointer. Therefore, the equality condition (`p == nil`) does not hold true.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_092/  

