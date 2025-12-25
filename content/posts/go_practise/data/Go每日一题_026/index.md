---
date: '2024-12-06T19:49:56+08:00'
draft: false
title: 'Go每日一题_026'
---
以下代码能否编译？

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

{{< togglecontent label="🔑 答案解析：" >}}

答：编译失败。
` map[string]Student `  的 value 是一个 Student 结构值，所以当` list["student"] = student `,是一个值拷贝过程。而list["student"]则是一个值引用。那么值引用的特点是`只读`。所以对list["student"].Name = "LDB"的修改是不允许的。

如果真要修改需要New一个新的结构体，修改内容后重新赋值

```go
    //list["student"].Name = "LDB"
    newStudent := list["student"]
    newStudent.Name = "LDB"
    list["student"] = newStudent
```

或者将map value 改为一个 Student 结构值指针
 map[string]*Student

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

{{< /togglecontent >}}
