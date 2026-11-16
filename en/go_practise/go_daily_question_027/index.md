# Go Daily Question 027


What is wrong with the following code and why?

```go
package main

import (
    "fmt"
)

type student struct {
    Name string
    Age  int
}

func main() {
    // Define map
    m := make(map[string]*student)

    // Define student array
    stus := []student{
        {Name: "zhou", Age: 24},
        {Name: "li", Age: 23},
        {Name: "wang", Age: 22},
    }

    // Add array elements to map one by one
    for _, stu := range stus {
        m[stu.Name] = &stu
    }

    // Print map
    for k,v := range m {
        fmt.Println(k ,"=>", v.Name)
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

### Note that this type of problem will change in Go versions after 1.22.

🔗:[Fixing For Loops in Go 1.22](https://go.dev/blog/loopvar-preview)

> Go >=1.22

```go
zhou => zhou
li => li
wang => wang
```

> Go < 1.22

```go
zhou => wang
li => wang
wang => wang
```

Before Go 1.22

```go
// Add array elements to map one by one
    for _, stu := range stus {
        m[stu.Name] = &stu
    }
```

Here, the address of `stu` is the same, so the value stored in `m[stu.Name]` is the same in each iteration.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_027/  

