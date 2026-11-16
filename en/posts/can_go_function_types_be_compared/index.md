# Go: Can Function Types Be Compared, and Why?


<!--more-->

## Can Go Function Types Be Compared?

### Comparison Operators

In the [Go official documentation](https://go.dev/ref/spec#Comparison_operators) regarding comparison operators, there is this passage:

> Slice, map, and function types are not comparable. However, as a special case, a slice, map, or function value may be compared to the predeclared identifier nil. Comparison of pointer, channel, and interface values to nil is also allowed and follows from the general rules above.
> 切片（Slice）、映射（map）和函数类型是不可比较的。然而，作为一种特殊情况，切片、映射或函数值可以与预先声明的标识符 `nil` 进行比较。指针、通道（channel）和接口值与 `nil` 的比较也是允许的，并且遵循上述一般规则。

Therefore, we can see that Go function types cannot be compared using comparison operators, but they can be compared with `nil`.
Example 1:

```go
package main

import "fmt"

func foo() {}

func main() {
    f1 := foo
    f2 := f1
    if f1 == f2 { // Compile error: invalid operation: f1 == f2 (func can only be compared to nil)
        fmt.Println("Functions are equal")
    }
}
```

[Run Online](https://go.dev/play/p/-MKUWeDBml7)

Example 2:

```go
package main

import "fmt"

func main() {
    var f1 func()
    if f1 == nil { // Function types can be compared with `nil`
        fmt.Println("f1 is nil")
    }
}
```

[Run Online](https://go.dev/play/p/QkKEt_KQwUd)

### reflect.DeepEqual

Above, comparison operators were used for comparing the two. We know that in Go, we can also use [`DeepEqual`](https://pkg.go.dev/reflect#DeepEqual) from the `reflect` package for comparison.
> func DeepEqual(x, y any) bool
Purpose: Determine if two values are "deeply equal"
> Func values are deeply equal if both are nil; otherwise they are not deeply equal.
> 函数值只有在二者都为 nil 时才深度相等；否则，它们不深度相等。

Example 3:

```go
package main

import (
    "fmt"
    "reflect"
)

func foo() {}

func main() {
    f1 := foo
    f2 := f1
    if reflect.DeepEqual(f1, f2) { // Returns false
        fmt.Println("Functions are equal")
    } else {
        fmt.Println("Functions are not equal") // Outputs: Functions are not equal
    }
}
```

[Run Online](https://go.dev/play/p/ta02lmtw1Vf)

We can also see from the [source code](https://github.com/golang/go/blob/2c1604142324be55a9274bc13a5a143bb3cde809/src/reflect/deepequal.go#L155) of `reflect.DeepEqual`:

```go
    case Func:
        if v1.IsNil() && v2.IsNil() {
            return true
        }
        // Can't do better than this:
        return false
```

### Summary

Go function types cannot be compared using comparison operators, but they can be compared with `nil`.

## Why?

From the above, we understand that the Go team restricted comparisons between function types when designing the Go language. But what is the purpose of this design?

### Hypothesis 1 (Compiler Inline Optimization)

```go
package main

var a = func() int { return 1 }()
var b = func() int { return 1 }()

func main() {
    sum := add(a, b)
    print(sum)
}
func add(a, b int) int {
    return a + b
}
```

Compile and view the assembly using the `objdump` tool:

```text
go build .\main.go
go tool objdump -s main.main .\main.exe
```

```asm
TEXT main.main(SB) C:/Code/Github/Go_T/main.go
  main.go:6             0x469960                493b6610                CMPQ SP, 0x10(R14)
  main.go:6             0x469964                7635                    JBE 0x46999b
  main.go:6             0x469966                55                      PUSHQ BP
  main.go:6             0x469967                4889e5                  MOVQ SP, BP
  main.go:6             0x46996a                4883ec10                SUBQ $0x10, SP
  main.go:7             0x46996e                488b05f3490800          MOVQ main.a(SB), AX
  main.go:11            0x469975                480305f4490800          ADDQ main.b(SB), AX
  main.go:11            0x46997c                4889442408              MOVQ AX, 0x8(SP)
  main.go:8             0x469981                e81a8afcff              CALL runtime.printlock(SB)
  main.go:8             0x469986                488b442408              MOVQ 0x8(SP), AX
  main.go:8             0x46998b                e8b090fcff              CALL runtime.printint(SB)
  main.go:8             0x469990                e86b8afcff              CALL runtime.printunlock(SB)
  main.go:9             0x469995                4883c410                ADDQ $0x10, SP
  main.go:9             0x469999                5d                      POPQ BP
  main.go:9             0x46999a                c3                      RET
  main.go:6             0x46999b                0f1f440000              NOPL 0(AX)(AX*1)
  main.go:6             0x4699a0                e8bb88ffff              CALL runtime.morestack_noctxt.abi0(SB)
  main.go:6             0x4699a5                ebb9                    JMP main.main(SB)
```

For comparison, we can also disable inline optimization during compilation:

```text
go build -gcflags="all=-l" .\main.go
PS C:\Code\Github\Go_T> go tool objdump -s main.main .\main.exe
```

```asm
  main.go:6             0x470000                493b6610                CMPQ SP, 0x10(R14)
  main.go:6             0x470004                763e                    JBE 0x470044
  main.go:6             0x470006                55                      PUSHQ BP
  main.go:6             0x470007                4889e5                  MOVQ SP, BP
  main.go:6             0x47000a                4883ec18                SUBQ $0x18, SP
  main.go:7             0x47000e                488b1d9bfc0b00          MOVQ main.b(SB), BX
  main.go:7             0x470015                488b058cfc0b00          MOVQ main.a(SB), AX
  main.go:7             0x47001c                0f1f4000                NOPL 0(AX)
  main.go:7             0x470020                e83b000000              CALL main.add(SB)
  main.go:7             0x470025                4889442410              MOVQ AX, 0x10(SP)
  main.go:8             0x47002a                e8517cfcff              CALL runtime.printlock(SB)
  main.go:8             0x47002f                488b442410              MOVQ 0x10(SP), AX
  main.go:8             0x470034                e8e782fcff              CALL runtime.printint(SB)
  main.go:8             0x470039                e8a27cfcff              CALL runtime.printunlock(SB)
  main.go:9             0x47003e                4883c418                ADDQ $0x18, SP
  main.go:9             0x470042                5d                      POPQ BP
  main.go:9             0x470043                c3                      RET
  main.go:6             0x470044                e83786ffff              CALL runtime.morestack_noctxt.abi0(SB)
  main.go:6             0x470049                ebb5                    JMP main.main(SB)
```

#### Compiler Inline Optimization

![alt text](image.png)

#### Disabling Compiler Inline Optimization

![alt text](image-1.png)

### Hypothesis 1 Summary

We can see that compiler inline optimization optimizes some code. The `add` function is inlined into the `main` function.
By default, compiler inline optimization causes some function calls to be replaced with the actual code of the function body. If the functions disappear, it's even more impossible to compare functions.

## How to solve scenarios requiring function comparison?

### Observer Pattern

```go
package main

import "fmt"

type Listener func()

var Listeners []Listener

func AddListener(l Listener) {
    Listeners = append(Listeners, l)
}

func CallListeners() {
    for _, l := range Listeners {
        l()
    }
}

func RmListener(l Listener) {
    // TODO Remove listener
}

func main() {
    AddListener(func() { fmt.Println("Hello") })
    AddListener(func() { fmt.Println("world") })
    CallListeners()
}
```

From the above code, we need to add a remove listener function for `Listener`.
Since functions in Go cannot be compared, the following code is incorrect:

```go
func RmListener(l Listener) {
    Listeners = slices.DeleteFunc(Listeners, func(x Listener) bool { return x == l })
    // invalid operation: x == l (func can only be compared to nil)compilerUndefinedOp
}
```

#### Solution 1: Use a struct to add a comparable tag to the function

```go
package main

import (
    "fmt"
    "slices"
)

type Tag struct{ *int }
type Listener func()

type taggedListener struct {
    tag      Tag
    listener Listener
}

var Listeners []taggedListener

func AddListener(l Listener) Tag {
    tag := Tag{new(int)}
    Listeners = append(Listeners, taggedListener{tag, l})
    return tag
}

func CallListeners() {
    for _, l := range Listeners {
        l.listener()
    }
}

func RmListener(tag Tag) {
    Listeners = slices.DeleteFunc(Listeners, func(x taggedListener) bool { return x.tag == tag })
}

func main() {
    HelloTag := AddListener(func() { fmt.Println("Hello") })
    AddListener(func() { fmt.Println("world") })
    CallListeners()
    // Remove Hello
    RmListener(HelloTag)
    CallListeners()
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/can_go_function_types_be_compared/  

