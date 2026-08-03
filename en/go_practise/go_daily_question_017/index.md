# Go Daily Question 017

Will the following code compile? Why or why not?

```go
package main

import "fmt"

func main() {

    sn1 := struct {
        age  int
        name string
    }{age: 11, name: "qq"}

    sn2 := struct {
        age  int
        name string
    }{age: 11, name: "qq"}

    if sn1 == sn2 {
        fmt.Println("sn1 == sn2")
    }

    sm1 := struct {
        age int
        m   map[string]string
    }{age: 11, m: map[string]string{"a": "1"}}

    sm2 := struct {
        age int
        m   map[string]string
    }{age: 11, m: map[string]string{"a": "1"}}

    if sm1 == sm2 {
        fmt.Println("sm1 == sm2")
    }
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: Cannot compile.

- Struct Comparison Rule Note 1: Only structs of the same type can be compared. Whether structs are the same depends not only on the number of attribute types, but also on the order of attributes.

```go
sn1 := struct {
    age  int
    name string
}{age: 11, name: "qq"}

sn3:= struct {
    name string
    age  int
}{age:11, name:"qq"}
```

`sn3` and `sn1` are not the same struct and thus cannot be compared.

- Struct Comparison Rule Note 2: If structs are of the same type, but their attributes include incomparable types, such as maps or slices, then the structs cannot be compared using `==`.

```go
sm1 := struct {
        age int
        m   map[string]string
    }{age: 11, m: map[string]string{"a": "1"}}

    sm2 := struct {
        age int
        m   map[string]string
    }{age: 11, m: map[string]string{"a": "1"}}

    if sm1 == sm2 {
        fmt.Println("sm1 == sm2")
    }
```

The struct attributes `m` in `sm1` and `sm2` are of type map, hence they cannot be compared using `==`.
You can use `reflect.DeepEqual` for comparison.

```go
if reflect.DeepEqual(sm1, sm2) {
        fmt.Println("sm1 == sm2")
} else {
        fmt.Println("sm1 != sm2")
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_017/  

