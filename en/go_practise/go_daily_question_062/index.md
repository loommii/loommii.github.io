# Go Daily Question 062


Which option can be filled in the blank in the following code?

```go
func main() {
    var s1 []int
    var s2 = []int{}
    if __ == nil {
        fmt.Println("yes nil")
    }else{
        fmt.Println("no nil")
    }
}
```

- A. s1
- B. s2
- C. Both s1 and s2

{{< details summary="🔑 Answer Analysis:" >}}
C
`s1` outputs "yes nil".
`s2` outputs "no nil".

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_062/  

