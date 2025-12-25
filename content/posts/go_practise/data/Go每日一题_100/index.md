---
date: '2024-12-06T20:45:29+08:00'
draft: false
title: 'Go每日一题_100'
---
下面这段代码输出什么？

```go
package main

import "fmt"

func f(n int) (r int) {
    defer func() {
        r += n
        recover()
    }()

    var f func()

    defer f()
    
    f = func() {
        r += 2
    }
    return n + 1
}

func main() {
    fmt.Println(f(3))
}
```

{{< togglecontent label="🔑 答案解析：" >}}
7

```go
// 先执行这一段代码, 然后 r 被赋值为 4
return n+1

// 然后执行，但是会触发panic
defer f()

// 最后执行，r 再加3 r=7,然后recover(),最后函数返回 7
defer func() {
        r += n
        recover()
    }()
```

{{< /togglecontent >}}
