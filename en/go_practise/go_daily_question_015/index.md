# Go Daily Question 015

In Go 1.15, does `var i interface{} = a` cause an additional heap memory allocation?
The specific code is:

```go
var a  int = 3
// Does the following cause additional memory allocation?
var i interface{} = a
```

{{< details summary="🔑 Answer Analysis:" >}}

Correct Answer: No.

Analysis:
**Go 1.15 Release Notes** mention an interesting improvement in the runtime section:

>Converting a small integer value into an interface value no longer causes allocation.

This means that converting small integers into interface values no longer requires memory allocation. Small integers refer to numbers between `0 and 255`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_015/  

