# Go Daily Question 126


Regarding the `init` function, which of the following statements are correct:

- A. A package can contain multiple `init` functions;
- B. When the program runs, `init` functions of dependent packages are executed first, then `init` functions within the `main` package;
- C. The `main` package cannot have `init` functions;
- D. An `init` function can be called by other functions;

{{< details summary="🔑 Answer Analysis:" >}}

A, B

Here are a few things to note about `init()` functions:

- The `init()` function is used for package initialization before program execution, such as initializing variables within the package;
- A package can have multiple `init()` functions, and a single source file can also contain multiple `init()` functions;
- The execution order of multiple `init()` functions within the same package is not explicitly defined, but `init` functions from different packages are determined by the dependency relationship of package imports;
- An `init()` function cannot be explicitly called or referenced (assigned to a function variable) in the code; otherwise, it will result in a compilation error;
- If a package is imported multiple times, e.g., A imports B, C imports B, A imports C, package B is imported multiple times, but package B will only be initialized once;
- Cyclic dependencies (e.g., A imports B, B imports A) are not allowed when importing packages and will result in a compilation failure;

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_126/  

