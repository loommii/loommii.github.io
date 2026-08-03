# Go Daily Question 184


Regarding type conversion, which of the following options is correct?

```go
A.
type MyInt int
var i int = 1
var j MyInt = i

B.
type MyInt int
var i int = 1
var j MyInt = (MyInt)i

C.
type MyInt int
var i int = 1
var j MyInt = MyInt(i)

D.
type MyInt int
var i int = 1
var j MyInt = i.(MyInt)
```

{{< details summary="🔑 Answer Analysis:" >}}

C

```go
type MyInt int // Defines a type alias
var i int = 1  // Declares and assigns variable i with value 1
// A
var j MyInt = i // Error, because the type of variable i is int, and the type of variable j is MyInt, they are not the same type and cannot be directly assigned.
// B
var j MyInt = (MyInt)i // Error, C/C++ style type casting syntax, invalid in Go.
// C
var j MyInt = MyInt(i) // Correct, Go's type conversion syntax, converts variable i to MyInt type.
// D
var j MyInt = i.(MyInt) // Error, this is Go's type assertion syntax, type assertion is used on empty interfaces or `any`.
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_184/  

