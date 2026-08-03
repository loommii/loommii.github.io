# Go Daily Question 20250506


<!--more-->

### Analysis

`increaseA()`'s return parameter is anonymous.
`increaseB()`'s return parameter is named.

![alt text](image.png)

In Go, the memory space for function return values is allocated on the caller's stack. The `return` assignment runs first, then `defer`.

##### 1. Behavior Analysis of `increaseA`

```go
func increaseA() int {
       var i int
       defer func() {
              i++
       }()
       return i
}
```

1.  In `increaseA`'s function stack, a local variable `i` is declared, initialized to 0.
2.  When `return i` is executed, the value of `i` (0) is copied to the caller's (`main` function's) stack as the return value.
3.  Then, the `defer` statement executes, incrementing the local variable `i` from 0 to 1.
4.  Since `defer` modifies the local variable `i` and not the return value on the caller's stack, the return value remains 0.

##### 2. Behavior Analysis of `increaseB`

```go
func increaseB() (r int) {
       defer func() {
              r++
       }()
       return r
}
```

1.  In `increaseB`'s function stack, `r` is a named return value, and its memory space is directly allocated on the caller's (`main` function's) stack.
2.  When `return r` is executed, the value of `r` (0) is written to the return value space on the caller's stack.
3.  Then, the `defer` statement executes, directly modifying `r` on the caller's stack, incrementing its value from 0 to 1.
4.  Since `r` is a named return value, the `defer` modification directly affects the value on the caller's stack.

Therefore, the correct answer is B. 0 1.


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250506/  

