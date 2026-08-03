# Go Daily Question 190



What are the scenarios for memory leaks?

{{< details summary="🔑 Answer Analysis:" >}}

- Long-lived objects holding references to short-lived objects: For example, objects referenced by global variables.
- Unclosed Goroutines: If a Goroutine starts but fails to terminate normally due to some reason (e.g., deadlock, infinite loop, channel blocking), it will continue to occupy memory.
- Improper use of the `time` package.
- Improper string operations.
- Unclosed resources like files and network connections.
- Improper CGO memory management: If your Go code uses CGO and allocates memory in C code, you need to manually free that memory. Otherwise, it will lead to a memory leak.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_190/  

