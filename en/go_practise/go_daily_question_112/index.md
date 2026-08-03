# Go Daily Question 112



What is the output of the following code?

```golang
package main

import (
    "fmt"
)

type A interface {
    ShowA() int
}

type B interface {
    ShowB() int
}

type Work struct {
    i int
}

func (w Work) ShowA() int {
    return w.i + 10
}

func (w Work) ShowB() int {
    return w.i + 20
}

func main() {
    var a A = Work{3}
    // Type Assertion
    // http://c.biancheng.net/view/4281.html
    s := a.(Work)
    fmt.Println(s.ShowA())
    fmt.Println(s.ShowB())
}
```

- A. 13 23
- B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

```
13
23
```

Reference Answer and Analysis: A.

### Key takeaway: Type Assertion

This problem can be viewed in conjunction with the third question from Day 15 and Day 16.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_112/  

