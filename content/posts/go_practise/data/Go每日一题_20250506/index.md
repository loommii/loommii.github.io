---
date: '2025-05-06T01:09:26+08:00'
draft: false
title: 'Go每日一题_20250506'
---

下面代码输出什么？

```go
package main

import (
	"fmt"
)

func increaseA() int {
	var i int
	defer func() {
		i++
	}()
	return i
}

func increaseB() (r int) {
	defer func() {
		r++
	}()
	return r
}

func main() {
	fmt.Println(increaseA())
	fmt.Println(increaseB())
}
// A. 1 1
// B. 0 1
// C. 1 0
// D. 0 0
```

{{< togglecontent label="🔑 答案解析：" >}}


B
[在线运行](https://go.dev/play/p/t2LDxNGFGQs)

---

### 解析

increaseA() 的返回参数是匿名
increaseB() 是具名

![alt text](image.png)

在 Go 语言中，函数返回值的内存空间会分配到调用者的栈上。先运行return赋值后运行defer。

##### 1. increaseA 的行为分析

```go
func increaseA() int {
       var i int
       defer func() {
              i++
       }()
       return i
}
```

1. 在 increaseA 的函数栈中，声明了一个局部变量 i，初始值为 0。
2. 执行 return i 时，会将 i 的值（0）复制到调用者（main 函数）的栈上，作为返回值。
3. 然后，defer 语句执行，将局部变量 i 的值从 0 增加到 1。
4. 由于 defer 修改的是局部变量 i，而不是调用者栈上的返回值，因此返回值仍然是 0。

##### 2. increaseB 的行为分析

```go
func increaseB() (r int) {
       defer func() {
              r++
       }()
       return r
}
```

1. 在 increaseB 的函数栈中，r 是一个命名返回值，其内存空间直接分配在调用者（main 函数）的栈上。
2. 执行 return r 时，会将 r 的值（0）写入调用者栈上的返回值空间。
3. 然后，defer 语句执行，直接修改调用者栈上的 r，将其值从 0 增加到 1。
4. 由于 r 是命名返回值，defer 的修改会直接影响调用者栈上的值。

因此 正确答案是 B. 0 1。

{{< /togglecontent >}}