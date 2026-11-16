# Go Daily Question 026


Will the following code compile?

```go
package main

import "fmt"

type Student struct {
    Name string
}

var list map[string]Student

func main() {

    list = make(map[string]Student)

    student := Student{"Aceld"}

    list["student"] = student
    list["student"].Name = "LDB"

    fmt.Println(list["student"])
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: Compilation fails.
The value of `map[string]Student` is a `Student` struct value, so when `list["student"] = student`, it's a value copy process. However, `list["student"]` then becomes a value reference. The characteristic of a value reference is that it is `read-only`. Therefore, modifying `list["student"].Name = "LDB"` is not allowed.

If you really need to modify it, you should create a new struct, modify its content, and then reassign it:

```go
    //list["student"].Name = "LDB"
    newStudent := list["student"]
    newStudent.Name = "LDB"
    list["student"] = newStudent
```

Alternatively, change the map value to a `Student` struct pointer:
`map[string]*Student`

```go
package main

import "fmt"

type Student struct {
    Name string
}

var list map[string]*Student

func main() {

    list = make(map[string]*Student)

    student := Student{"Aceld"}

    list["student"] = &student
    list["student"].Name = "LDB"

    fmt.Println(list["student"])
}

```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_026/  

