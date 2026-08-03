# Go Daily Question 078


What is the difference between the following two slice declarations? Which one is more preferable?

```go
A. var a []int
B. a := []int{}
```

{{< details summary="🔑 Answer Analysis:" >}}
A: Declares `[]int` uninitialized, pointing to `nil`.
B: Declares `[]int` initialized, pointing to an empty array.

A can be declared globally.
B can only be declared inside a function.

A and B theoretically occupy the same memory space.
Note: An empty slice points to a fixed address, so no actual memory is allocated.

However, B points to an empty array in addition to A, and this operation consumes extra performance (🤏). From a performance perspective, A has an advantage.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_078/  

