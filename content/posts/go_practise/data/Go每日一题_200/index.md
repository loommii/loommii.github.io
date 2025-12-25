---
date: '2025-03-01T02:08:44+08:00'
draft: false
title: 'Go每日一题_200'
---

init() 函数是什么时候执行的？

{{< togglecontent label="🔑 答案解析：" >}}

答:init()是再main()函数执行前

一句话总结： `import –> const –> var –> init() –> main()`

如果有多个init就要分情况

## 单个源文件的 init 执行顺序

结论： `同一个源文件的 init 函数执行顺序与其定义顺序一致，从上到下。`

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

## 单个包的 init 执行顺序

结论： `同一个包中不同源文件 init 函数的执行顺序，是根据文件名的字典序来确定。`

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

## main 包导入多个包时 init 执行顺序-不存在依赖

结论： `对于不同的包，如果不相互依赖的话，按照 main 包中导入顺序调用包的 init 函数，最后再调用 main 包的 init 函数。`

```go
// a 包
// a.go
package a

func init() {
    println("init a")
}

// b 包
// b.go
package b

func init() {
    println("init b")
}

// c 包
// c.go
package c

func init() {
    println("init c")
}

// main 包
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

## main 包导入多个包时 init 执行顺序-存在依赖

结论： `如果 package 存在依赖，不同包的 init 函数按照包导入的依赖关系决定执行顺序。 调用顺序为最后被依赖的最先被初始化，如导入顺序 main > a > b > c，则初始化顺序为 c > b > a > main，依次执行对应的 init 方法`

```go
// a 包
// a.go
package a

import _ "main/b"

func init() {
    println("init a")
}

// b 包
// b.go
package b

import _ "main/c"

func init() {
    println("init b")
}

// c 包
// c.go
package c

func init() {
    println("init c")
}

// main 包
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

## 包级变量初始化与 init 函数执行顺序

结论:`如果包存在包级变量，则先于包的 init 函数完成初始化。`

```go
// a 包
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

// b 包
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

// c 包
// c.go
package c

var C = func() string {
    println("init var C")
    return "C"
}()

func init() {
    println("init c")
}

// main 包
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

参考资料:

- 🔗:[一文读懂 Golang init 函数执行顺序](https://cloud.tencent.com/developer/article/2138066)

{{< /togglecontent >}}
