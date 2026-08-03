# Go Daily Question 006

What is the flaw in the following code:

```go
func sum(x, y int)(total int, error) {
    return x+y, nil
}
```

{{< details summary="🔑 Answer Analysis:" >}}

```text
Answer: ``(total int, error)`` the second return value error is not named.

Analysis:
When a function has multiple return values, if one return value is named, all others must also be named.
``func sum(x, y int)(total int,err error) {`` If there are multiple return values, they must be enclosed in parentheses ().
``func sum(x, y int)(total int,err error)``
``func sum(x, y int)int`` If there is only one return value and it is named, it must also be enclosed in parentheses (). ``func sum(x, y int)(total int) {``

Here, the first return value `total` is named, but the second one is not, which is an error.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_006/  

