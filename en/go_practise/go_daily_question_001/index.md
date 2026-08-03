# Go Daily Question 001 - Address Traps in Range Loops

In Go programming, the range loop is a common source of pitfalls. This article will delve into a classic problem, exploring the behavior differences before and after Go 1.22.

<!--more-->

## Problem

What is the output of the following code, and explain why.

```go
func main() {
    slice := []int{0,1,2,3}
    m := make(map[int]*int)

    for key,val := range slice {
        m[key] = &val
    }

    for k,v := range m {
        fmt.Println(k,"->",*v)
    }
}
```

## Analysis

{{< admonition question >}}
### Go Version Differences
Note that this type of problem will change after Go 1.22.

🔗:[Fixing For Loops in Go 1.22](https://go.dev/blog/loopvar-preview)
{{< /admonition >}}

### Case for Go >= 1.22

```go
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

**Explanation**: Starting from Go 1.22, new variables `key` and `val` are created for each loop iteration. Therefore, the addresses of `key` and `val` variables are different in each iteration.

Adding verification print statements to the source code:

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)
    for key, val := range slice {
        m[key] = &val
        fmt.Println("key value", key, "key address", &key, "slice[", key, "] address", &slice[key], "val address", &val)
    }
    fmt.Println("m content", m)
    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

```text
//GO Version 1.22.4
key value 0 key address 0xc00000a0e0 slice[ 0 ] address 0xc000014200 val address 0xc00000a0c8
key value 1 key address 0xc00000a110 slice[ 1 ] address 0xc000014208 val address 0xc00000a0e8
key value 2 key address 0xc00000a120 slice[ 2 ] address 0xc000014210 val address 0xc00000a118
key value 3 key address 0xc00000a130 slice[ 3 ] address 0xc000014218 val address 0xc00000a128
m content map[0:0xc00000a0c8 1:0xc00000a0e8 2:0xc00000a118 3:0xc00000a128]
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

### Case for Go < 1.22

```go
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

**Analysis**: In versions before Go 1.22, the `for key, val := range slice` statement created the `key` and `val` variables only once during the entire loop. In each loop iteration, the value of the `val` variable was updated to the value of the `slice` element, but the address of the `val` variable remained unchanged.

When the code reaches `m[key] = &val`, `m[key]` stores the address of the `val` variable. Since all iterations use the same `val` variable, all values in `m` point to the same address. After the loop, the value of `val` is the value of the last element (i.e., 3), so all pointers point to the value 3.

Adding verification print statements to the source code:

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)
    for key, val := range slice {
        m[key] = &val
        fmt.Println("key value", key, "key address", &key, "slice[", key, "] address", &slice[key], "val address", &val)
    }
    fmt.Println("m content", m)
    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

```go
//GO Version 1.20.5
key value 0 key address 0xc00000a0c8 slice[ 0 ] address 0xc00000e220 val address 0xc00000a0e0
key value 1 key address 0xc00000a0c8 slice[ 1 ] address 0xc00000e228 val address 0xc00000a0e0
key value 2 key address 0xc00000a0c8 slice[ 2 ] address 0xc00000e230 val address 0xc00000a0e0
key value 3 key address 0xc00000a0c8 slice[ 3 ] address 0xc00000e238 val address 0xc00000a0e0
m content map[0:0xc00000a0e0 1:0xc00000a0e0 2:0xc00000a0e0 3:0xc00000a0e0]
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

## Summary

{{< admonition quote >}}
**Key Takeaway**: The `for range` loop creates a copy of each element, not a reference to the element.

Before Go 1.22, loop variables were reused in each iteration; starting from Go 1.22, new loop variables are created for each iteration, which resolves many common pitfalls.
{{< /admonition >}}

References:

- 🔗:[【golang】for range中取地址操作的陷阱](https://blog.csdn.net/idwtwt/article/details/87378419)


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_001/  

