# Go Daily Question 090


What is the output of the following code? Why?

```go
type People interface {
    Speak(string) string
}

type Student struct{}

func (stu *Student) Speak(think string) (talk string) {
    if think == "speak" {
        talk = "speak"
    } else {
        talk = "hi"
    }
    return
}

func main() {
    var peo People = Student{}
    think := "speak"
    fmt.Println(peo.Speak(think))
}

```

A. speak
B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}
B
Compilation error: `Student does not implement People (Speak method has pointer receiver)`. The value type `Student` does not implement the `Speak()` method of the interface; instead, the pointer type `*Student` implements this method.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_090/  

