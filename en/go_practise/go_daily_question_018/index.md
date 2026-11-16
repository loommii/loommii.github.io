# Go Daily Question 018

What's wrong with the following code?

```go
package main

const cl = 100

var bl = 123

func main()  {
    println(&bl,bl)
    println(&cl,cl)
}
```

{{< details summary="🔑 Answer Analysis:" >}}
Answer: It won't compile.
`cl` is a constant. The address of a constant cannot be taken.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_018/  

