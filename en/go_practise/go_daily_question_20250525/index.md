# Go Daily Question 20250525


Is map thread-safe? How to implement a thread-safe map?

{{< details summary="🔑 Answer Analysis:" >}}

It is not concurrently safe. For scenarios with concurrent map writes, you can use the official `sync.Map`. If implementing it yourself, use locks or serialize access through channels.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250525/  

