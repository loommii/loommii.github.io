# Go Daily Question 030


Will the following code compile? Why?

```go
package main

import (
    "fmt"
)

type People interface {
    Speak(string) string
}

type Student struct{}

func (stu *Student) Speak(think string) (talk string) {
    if think == "love" {
        talk = "You are a good boy"
    } else {
        talk = "hi"
    }
    return
}

func main() {
    var peo People = Student{}
    think := "love"
    fmt.Println(peo.Speak(think))
}
```

{{< details summary="🔑 Answer Analysis:" >}}

It will not compile because `*Student` implements the interface, not `Student`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_030/  

