# Go Daily Question 029


Which of the following assignments is correct?

A. var x = nil
B. var x interface{} = nil
C. var x string = nil
D. var x error = nil

{{< details summary="🔑 Answer Analysis:" >}}

BD. This question tests the knowledge of `nil`. `nil` can only be assigned to pointers.

A: Type not specified.
B: Empty interface can be assigned `nil`.
C: A string is essentially a read-only slice and cannot be assigned `nil`.
D: `error` is essentially an interface type and can be assigned `nil`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_029/  

