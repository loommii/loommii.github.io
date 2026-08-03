# Go Daily Question 185


Regarding switch statements, which of the following statements are correct?

- A. The condition expression must be a constant or an integer;
- B. In a single case, multiple result options can appear;
- C. `break` is needed to explicitly exit a case;
- D. Only when the `fallthrough` keyword is explicitly added to a case will the immediately following case continue to be executed;

{{< details summary="🔑 Answer Analysis:" >}}

BD

A is incorrect. The condition is not limited to constants or integers.
B is correct. Multiple options can appear in a single case.

```go
case "apple", "banana":
    fmt.Println("Fruit")
```

C is incorrect. Go language does not require `break`.
D is correct.

```go
case 1:
    fmt.Println("1")
    fallthrough  // Will continue to execute the next case
case 2:
    fmt.Println("2")
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_185/  

