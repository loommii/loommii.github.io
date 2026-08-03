# Go Daily Question 070


In the following code, `x` is declared, `y` is not declared. Determine whether each statement is correct.

x, _:= f()
x,_ = f()
x, y := f()
x, y = f()

{{< details summary="🔑 Answer Analysis:" >}}
1. Incorrect
2. Correct
3. Correct
4. Incorrect
Variable declaration. 1. Incorrect, `x` is already declared, so `:=` cannot be used; 2. Correct; 3. Correct, when assigning multiple values, at least one variable on the left side of `:=` must be undeclared; 4. Incorrect, `y` is not declared.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_070/  

