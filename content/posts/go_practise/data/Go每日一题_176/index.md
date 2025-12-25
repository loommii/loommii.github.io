---
date: '2025-02-05T00:45:26+08:00'
draft: false
title: 'Go每日一题_176'
---
下面这段代码输出什么？为什么？

```go
package main

import "fmt"

type People interface {
    Show()
}

type Student struct{}

func (stu *Student) Show() {

}

func main() {

    var s *Student
    if s == nil {
        fmt.Println("s is nil")
    } else {
        fmt.Println("s is not nil")
    }
    var p People = s
    if p == nil {
        fmt.Println("p is nil")
    } else {
        fmt.Println("p is not nil")
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

```go
s is nil
p is not nil
```

>记住一点，当且仅当动态值和动态类型都为 nil 时，接口类型值才为 nil。

**代码解析：**

### 1. 变量 `s` 的判断

- `var s *Student` 声明了一个 `*Student` 类型的指针变量 `s`，默认值为 `nil`
- 直接判断 `s == nil` 为 `true`，输出 `s is nil`

### 2. 变量 `p` 的判断

- `var p People = s` 将 `s`（值为 `nil` 的指针）赋值给接口类型 `People` 的变量 `p`
- **Go 接口的底层结构**：接口变量 `p` 包含两个字段：
  - `动态类型`（`*Student`）：存储赋值给接口的具体类型
  - `动态值`（`nil`）：存储具体类型的值
- **接口判空规则**：只有当接口的 `动态类型` 和 `动态值` 同时为 `nil` 时，接口变量才等于 `nil`
  - 本例中，`p` 的 `动态类型` 是 `*Student`（非 `nil`），`动态值` 是 `nil`，因此 `p == nil` 为 `false`，输出 `p is not nil`

### 关键结论

- **指针判空**：`var s *T` 的默认值是 `nil`
- **接口判空**：
  - 如果直接将 `nil` 赋给接口（如 `var p People = nil`），则接口的 `动态类型` 和 `动态值` 均为 `nil`，此时 `p == nil` 为 `true`
  - 如果通过具体类型的 `nil` 指针赋给接口（如 `var p People = s`），则接口的 `动态类型` 会被记录为具体类型（非 `nil`），即使值为 `nil`，接口变量也不等于 `nil`

**总结：**

我们分配给变量 `p` 的值明明是 `nil`，然而 `p` 却不是 `nil`。记住一点，当且仅当动态值和动态类型都为 `nil` 时，接口类型值才为 `nil`。上面的代码中，给变量 `p` 赋值之后，`p` 的动态值是 `nil`，但是动态类型却是 `*Student`，是一个 `nil` 指针，所以 `p == nil` 为 `false`。

{{< /togglecontent >}}
