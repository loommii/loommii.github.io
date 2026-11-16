# Go Daily Question 187


Can data be appended to a nil slice?

{{< details summary="🔑 Answer Analysis:" >}}

It depends on the declaration. If declared as `var a []int = nil`, then data can be appended. If declared as `var a *[]int = nil`, then it cannot.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_187/  

