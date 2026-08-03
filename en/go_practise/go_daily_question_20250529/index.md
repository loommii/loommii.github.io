# Go Daily Question 20250529


What is the output of the following code?

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]Math{
	"foo": Math{2, 3},
}

func main() {
	m["foo"].x = 4
	fmt.Println(m["foo"].x)
}
```

A. 4
B. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

Reference answer and explanation: B, compilation error `cannot assign to struct field m["foo"].x in map`. Reason for error: For an assignment operation similar to `X = Y`, the address of `X` must be known to assign the value of `Y` to `X`, but the value of a map itself in Go is not addressable.

There are two solutions:

a. Use a temporary variable

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]Math{
	"foo": Math{2, 3},
}

func main() {
	tmp := m["foo"]
	tmp.x = 4
	m["foo"] = tmp
	fmt.Println(m["foo"].x)
}
```

b. Modify the data structure

```go
package main

import "fmt"

type Math struct {
	x, y int
}

var m = map[string]*Math{
	"foo": &Math{2, 3},
}

func main() {
	m["foo"].x = 4
	fmt.Println(m["foo"].x)
	fmt.Printf("%#v", m["foo"]) // %#v formats and outputs detailed information
}
```

References:

*   https://blog.csdn.net/qq_36431213/article/details/82805043
*   https://www.cnblogs.com/DillGao/p/7930674.html
*   https://haobook.readthedocs.io/zh_CN/latest/periodical/201611/zhangan.html
*   https://suraj.pro/post/golang_workaround/
*   https://blog.ijun.org/2017/07/cannot-assign-to-struct-field-in-map.html

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250529/  

