# Go Daily Question 161


In the following code, `x` is declared, `y` is not declared. Determine whether each statement is correct.

```go
1）x, _ := f()
2）x, _ = f()
3）x, y := f()
4）x, y = f()
```

{{< details summary="🔑 Answer Analysis:" >}}

1) Incorrect
2) Correct
3) Correct
4) Incorrect

### 1. `x, _ := f()`

- **Incorrect**.
- **Reason**: `:=` is the short variable declaration operator, which requires all variables on the left side to be undeclared. Since `x` is already declared, `:=` cannot be used.
- **Correction**: If `x` is already declared, the `=` assignment operator should be used:

  ```go
  x, _ = f()
  ```

### 2. `x, _ = f()`

- **Correct**.
- **Reason**: `=` is the assignment operator and can be used for already declared variables. `x` is already declared, and `_` is the blank identifier used to ignore return values, so this statement is legal.

### 3. `x, y := f()`

- **Correct**.
- **Reason**: `:=` is the short variable declaration operator, which requires at least one variable on the left side to be undeclared. Although `x` is already declared, `y` is undeclared, so this statement is legal. In this case, `x` will be reassigned, and `y` will be declared and assigned.

### 4. `x, y = f()`

- **Incorrect**.
- **Reason**: `=` is the assignment operator, which requires all variables on the left side to be declared. Since `y` is undeclared, this statement will fail to compile.
- **Correction**: If `y` is undeclared, `:=` should be used:

  ```go
  x, y := f()
  ```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_161/  

