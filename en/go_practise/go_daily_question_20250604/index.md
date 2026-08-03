# Go Daily Question 20250604


What does the following code output?

```go
package main

import "fmt"

func f(n int) (r int) {
    defer func() {
        r += n
        recover()
    }()

    var f func()

    defer f()
    
    f = func() {
        r += 2
    }
    return n + 1
}

func main() {
    fmt.Println(f(3))
}
```

{{< details summary="🔑 Solution Analysis:" >}}

7

```go
// First execute this code, then r is assigned the value 4
return n+1

// Then it executes, but triggers a panic
defer f()

// Finally it executes, r increases by 3, r=7, then recover(), and the function returns 7
defer func() {
        r += n
        recover()
    }()
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250604/  

