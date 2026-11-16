# Go Daily Question 210


In Go 1.15, does `var i interface{} = a` cause an additional heap memory allocation?
The specific code is:

```go
var a  int = 3
// Does the following cause additional memory allocation?
var i interface{} = a
```

{{< details summary="🔑 Answer Analysis:" >}}

Correct Answer: No.

Analysis:

In Go, interfaces are implemented as a pair of pointers (see Russ Cox's Go Data Structures: Interfaces): a pointer to type information and a pointer to the value. It can be simply represented as:

```go
type iface struct {
    tab  *itab
    data unsafe.Pointer
}
```

Where `tab` is a pointer to type information; `data` is a pointer to the value. Therefore, generally an interface means that the value must be dynamically allocated in the heap.

Simply put, an interface is equal to a type plus a value, so the value will be dynamically allocated in the heap.
Why then, in this problem, is there no allocation?
Because in Go 1.15, the [**Go 1.15 Release Notes**](https://golang.google.cn/doc/go1.15) mentioned an interesting improvement in the runtime section:

> Converting a small integer value into an interface value no longer causes allocation.

This means that converting small integers into interface values no longer requires memory allocation. Small integers refer to numbers between 0 and 255.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_210/  

