# Go Daily Question 119


Consider the following 3 lines of code:

What is the output of the following code?

```go
// On a 32-bit machine
1）var x int32 = 32.0
2）var y int = x
3）var z rune = x
```

Will they compile? Why?

If asked this question in an interview, you need to consider what the interviewer wants to test you on.
{{< details summary="🔑 Answer Analysis:" >}}

Reference Answer and Analysis:
Answer: Cannot compile.

1) This is allowed because `32.0` is an untyped literal and can be assigned to `int32`.
2) `int` occupies 32 bits on a 32-bit machine and 64 bits on a 64-bit machine. Although `int` in the problem occupies the same space as `int32`, they are different types and cannot be assigned directly, resulting in a compilation error.
3) `rune` is an alias for `int32`, so it can compile.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_119/  

