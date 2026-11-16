# Go Daily Question 039


Regarding channels, which of the following syntax is correct:

```go
A. var ch chan int
B. ch := make(chan int)
C. <- ch
D. ch <-
```

{{< details summary="🔑 Answer Analysis:" >}}
Answer: ABC

A and B both declare a channel; C reads from a channel;
Writing to a channel must include a value, so D is incorrect.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_039/  

