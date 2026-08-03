# Go Daily Question 100


What is the output of the following code?

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

{{< details summary="🔑 Answer Analysis:" >}}
7

```go
// This code is executed first, then r is assigned 4
return n+1

// Then execute, but it will trigger a panic
defer f()

// Finally, execute, r is incremented by 3 again (r=7), then recover(), and finally the function returns 7
defer func() {
        r += n
        recover()
    }()
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_100/  

