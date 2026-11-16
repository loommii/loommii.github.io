# Go Daily Question 010


When is the init() function executed?

{{< details summary="🔑 Answer Analysis:" >}}

Answer: init() is executed before the main() function.

In summary: `import –> const –> var –> init() –> main()`

If there are multiple init functions, the situation varies.

## Execution Order of init in a Single Source File

Conclusion: `The execution order of init functions within the same source file is consistent with their definition order, from top to bottom.`

```go
package main

func init() {
    println("init a")
}

func init() {
    println("init b")
}

func init() {
    println("init c")
}

func main() {
    println("main")
}
```

```go
$ go run main.go
init a
init b
init c
main
```

## Execution Order of init in a Single Package

Conclusion: `The execution order of init functions in different source files within the same package is determined by the lexicographical order of their filenames.`

```go
// a.go
package main

func init() {
    println("init a")
}

// b.go
package main

func init() {
    println("init b")
}

// c.go
package main

func init() {
    println("init c")
}

// main.go
package main

func init() {
    println("init main")
}

func main() {
    println("main")
}
```

```go
$ go build && ./main
init a
init b
init c
init main
main
```

## Execution Order of init when main Package Imports Multiple Packages - No Dependencies

Conclusion: `For different packages, if they do not depend on each other, the init functions of the packages are called in the order of their import in the main package, and finally the init function of the main package is called.`

```go
// Package a
// a.go
package a

func init() {
    println("init a")
}

// Package b
// b.go
package b

func init() {
    println("init b")
}

// Package c
// c.go
package c

func init() {
    println("init c")
}

// main Package
// main.go
package main

import (
    _ "main/a"
    _ "main/b"
    _ "main/c"
)

func init() {
    println("init main")
}

func main() {
    println("main")
}
```

```go
$ go build && ./main
init a
init b
init c
init main
main
```

## Execution Order of init when main Package Imports Multiple Packages - With Dependencies

Conclusion: `If packages have dependencies, the execution order of init functions in different packages is determined by the dependency relationship of package imports. The calling order is that the last depended-on package is initialized first. For example, if the import order is main > a > b > c, then the initialization order is c > b > a > main, with the corresponding init methods executed sequentially.`

```go
// Package a
// a.go
package a

import _ "main/b"

func init() {
    println("init a")
}

// Package b
// b.go
package b

import _ "main/c"

func init() {
    println("init b")
}

// Package c
// c.go
package c

func init() {
    println("init c")
}

// main Package
// main.go
package main

import (
    _ "main/a"
)

func init() {
    println("init main")
}

func main() {
    println("main")
}
```

```go
$ go build && ./main
init c
init b
init a
init main
main
```

## Initialization Order of Package-Level Variables and init Functions

Conclusion: `If a package has package-level variables, they are initialized before the package's init function is executed.`

```go
// Package a
// a.go
package a

import _ "main/b"

var A = func() string {
    println("init var A")
    return "A"
}()

func init() {
    println("init a")
}

// Package b
// b.go
package b

import _ "main/c"

var B = func() string {
    println("init var B")
    return "B"
}()

func init() {
    println("init b")
}

// Package c
// c.go
package c

var C = func() string {
    println("init var C")
    return "C"
}()

func init() {
    println("init c")
}

// main Package
// main.go
package main

import (
    _ "main/a"
)

var m = func() string {
    println("init var m")
    return "m"
}()

func init() {
    println("init main")
}

func main() {
    println("main")
}
```

```go
$ go build && ./main
init var C
init c
init var B
init b
init var A
init a
init var m
init main
main
```

References:

- 🔗:[Understanding Golang init Function Execution Order in One Article](https://cloud.tencent.com/developer/article/2138066)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_010/  

