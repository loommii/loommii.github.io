# Go Daily Question 195



What is the flaw in the following code:

```go
func sum(x, y int)(total int, error) {
    return x+y, nil
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: The second return value is not named.

Analysis:

When a function has multiple return values, if one return value is named, all others must also be named.
If there are multiple return values, they must be enclosed in parentheses `()`; if there is only one named return value, it must also be enclosed in parentheses `()`. Here, the first return value `total` is named, but the second one is not, which is an error.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_195/  

