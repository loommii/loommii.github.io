---
date: '2025-02-17T23:43:08+08:00'
draft: false
title: 'Go每日一题_188'
---
谈一下切片的复制过程。

{{< togglecontent label="🔑 答案解析：" >}}

### Go切片分为浅拷贝和深拷贝

#### 浅拷贝

Go切片是由长度、容量、底层数值组成的。浅拷贝就是仅复制切片头（切片指针、长度、容量）  
由于切片的底层数组是共享的，因此修改切片元素会影响到其他切片。

```go
// 浅拷贝 方式一
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}

    slice2 := slice1 // 浅拷贝
    slice2[0] = 4
    fmt.Println(slice1) // [4 2 3]
}
```

#### 深拷贝

```go
// 深拷贝 方式一
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}
    var slice2 []int = make([]int, len(slice1))
    copy(slice2, slice1)
    slice2[0] = 4
    fmt.Println(slice1)  // [1 2 3]
}
// 深拷贝 方案二
package main

import "fmt"

func main() {
    var slice1 []int = []int{1, 2, 3}
    var slice2 []int
    slice2 = append(slice2, slice1...)
    slice2[0] = 4
    fmt.Println(slice1)  // [1 2 3]
    fmt.Println(slice2)  // [4 2 3]
}
```

{{< /togglecontent >}}
