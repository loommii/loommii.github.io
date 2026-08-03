# Go Daily Question 032


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

No, because it is `*Student` that implements the `People` interface method.
However, here `Student` is assigned to the `People` interface type. Thus, it results in a compilation error.
It needs to be modified to:

```go
var peo People = &Student{}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_032/  

