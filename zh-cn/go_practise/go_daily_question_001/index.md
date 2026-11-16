# Go每日一题_001 - Range循环中的地址陷阱

在Go语言编程中，range循环是一个常见的陷阱来源。本文将通过一道经典题目，深入探讨Go 1.22版本前后的行为差异。

<!--more-->

## 问题

下面这段代码输出什么，说明原因。

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

## 解析

{{< admonition question >}}
### Go版本差异
注意此类问题在Go 1.22版本后将会有变化。

🔗:[修复 Go 1.22 中的 For 循环](https://go.dev/blog/loopvar-preview)
{{< /admonition >}}

### Go >= 1.22 的情况

```go
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

**解释**：从Go 1.22开始，每次循环迭代都会创建新的变量 `key` 和 `val`，因此每次循环的 `key` 和 `val` 变量的地址都是不同的。

在源代码上增加验证打印：

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)
    for key, val := range slice {
        m[key] = &val
        fmt.Println("key的值", key, "key的地址", &key, "slice[", key, "] 的地址", &slice[key], "val 的地址", &val)
    }
    fmt.Println("m集合的内容", m)
    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

```text
//GO版本 1.22.4
key的值 0 key的地址 0xc00000a0e0 slice[ 0 ] 的地址 0xc000014200 val 的地址 0xc00000a0c8
key的值 1 key的地址 0xc00000a110 slice[ 1 ] 的地址 0xc000014208 val 的地址 0xc00000a0e8
key的值 2 key的地址 0xc00000a120 slice[ 2 ] 的地址 0xc000014210 val 的地址 0xc00000a118
key的值 3 key的地址 0xc00000a130 slice[ 3 ] 的地址 0xc000014218 val 的地址 0xc00000a128
m集合的内容 map[0:0xc00000a0c8 1:0xc00000a0e8 2:0xc00000a118 3:0xc00000a128]
0 -> 0
1 -> 1
2 -> 2
3 -> 3
```

### Go < 1.22 的情况

```go
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

**解析**：在Go 1.22之前的版本中，`for key, val := range slice` 语句在整个循环过程中只创建一次变量 `key` 和 `val`。在每次循环迭代中，`val` 变量的值被更新为 `slice` 元素的值，但 `val` 变量的地址保持不变。

当代码运行到 `m[key] = &val` 时，`m[key]` 存储的是 `val` 变量的地址。由于所有迭代都使用同一个 `val` 变量，因此 `m` 中的所有值都指向同一个地址。循环结束后，`val` 变量的值是最后一个元素的值（即3），所以所有指针都指向值3。

在源代码上增加验证打印：

```go
package main

import "fmt"

func main() {
    slice := []int{0, 1, 2, 3}
    m := make(map[int]*int)
    for key, val := range slice {
        m[key] = &val
        fmt.Println("key的值", key, "key的地址", &key, "slice[", key, "] 的地址", &slice[key], "val 的地址", &val)
    }
    fmt.Println("m集合的内容", m)
    for k, v := range m {
        fmt.Println(k, "->", *v)
    }
}
```

```go
//GO版本 1.20.5
key的值 0 key的地址 0xc00000a0c8 slice[ 0 ] 的地址 0xc00000e220 val 的地址 0xc00000a0e0
key的值 1 key的地址 0xc00000a0c8 slice[ 1 ] 的地址 0xc00000e228 val 的地址 0xc00000a0e0
key的值 2 key的地址 0xc00000a0c8 slice[ 2 ] 的地址 0xc00000e230 val 的地址 0xc00000a0e0
key的值 3 key的地址 0xc00000a0c8 slice[ 3 ] 的地址 0xc00000e238 val 的地址 0xc00000a0e0
m集合的内容 map[0:0xc00000a0e0 1:0xc00000a0e0 2:0xc00000a0e0 3:0xc00000a0e0]
0 -> 3
1 -> 3
2 -> 3
3 -> 3
```

## 总结

{{< admonition quote >}}
**知识点**: for range 循环的时候会创建每个元素的副本，而不是元素的引用。

在Go 1.22之前，循环变量在每次迭代中被重用；从Go 1.22开始，每次迭代都会创建新的循环变量，解决了许多常见的陷阱。
{{< /admonition >}}

参考资料：

- 🔗:[【golang】for range中取地址操作的陷阱](https://blog.csdn.net/idwtwt/article/details/87378419)


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_001/  

