# Go Daily Question 085


Which of the following options is correct?

```go
func main() {
    if a := 1; false {
    } else if b := 2; false {
    } else {
        println(a, b)
    }
}
```

A. 1 2
B. compilation error
{{< details summary="🔑 Answer Analysis:" >}}

Involves code block issues.
For details, you can refer to this article:
<https://studygolang.com/articles/35587>
After expanding, the code becomes:

```go
{
        a := 1
        if false {

        } else {
            b := 2
            if false {

            } else {
                println(a, b)
            }
        }
    }
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_085/  

