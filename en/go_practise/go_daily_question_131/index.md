# Go Daily Question 131


Regarding channels, which of the following syntax is correct:

- A. var ch chan int
- B. ch := make(chan int)
- C. <- ch
- D. ch <-

{{< details summary="🔑 Answer Analysis:" >}}

A, B, C

A declares variable `ch` of type `chan int`, but does not initialize it.
B declares variable `ch` of type `chan int`, and initializes it.
C reads from the channel, discarding the value.
D is incorrect; writing to a channel requires a value.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_131/  

