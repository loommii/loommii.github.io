# Go Daily Question 182


Regarding loop statements, which of the following statements are correct? ()

- A. Loop statements support both the `for` keyword, and `while` and `do-while`;
- B. The basic usage of the `for` keyword is no different from that in C/C++;
- C. `for` loops support `continue` and `break` to control the loop, but it provides a more advanced `break` that allows choosing which loop to interrupt;
- D. `for` loops do not support multiple assignment statements separated by commas; multiple variables must be initialized using parallel assignment;

{{< details summary="🔑 Answer Analysis:" >}}

CD

### C

Go supports labeled `break`, which can specify breaking out of an outer loop:

```go
OuterLoop:
for i := 0; i < 5; i++ {
    for j := 0; j < 5; j++ {
        if someCondition {
            break OuterLoop // Directly breaks out of the outer loop
        }
    }
}
```

### D

Go supports labeled `break`, which can specify breaking out of an outer loop:

```go
// ✅ Correct way (parallel assignment)
for i, j := 0, 1; i < 10; i, j = i+1, j*2 { ... }

// ❌ Incorrect way (comma-separated)
for i = 0, j = 1; i < 10; i++, j*=2 { ... }
```

### A❌ Incorrect

Go language only has `for` loops; it does not have `while` and `do-while` keywords, but these two loops can be simulated using variations of the `for` loop.

### B❌ Incorrect

C/C++ `for` loops (require parentheses).
Go multiple assignment statements must use parallel assignment. C/C++ uses comma-separated multiple variable initialization.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_182/  

