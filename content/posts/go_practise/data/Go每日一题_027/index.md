---
date: '2024-12-06T19:49:55+08:00'
draft: false
title: 'Go每日一题_027'
---
以下代码有什么问题，说明原因

```go
package main

import (
    "fmt"
)

type student struct {
    Name string
    Age  int
}

func main() {
    //定义map
    m := make(map[string]*student)

    //定义student数组
    stus := []student{
        {Name: "zhou", Age: 24},
        {Name: "li", Age: 23},
        {Name: "wang", Age: 22},
    }

    //将数组依次添加到map中
    for _, stu := range stus {
        m[stu.Name] = &stu
    }

    //打印map
    for k,v := range m {
        fmt.Println(k ,"=>", v.Name)
    }
}
```

{{< togglecontent label="🔑 答案解析：" >}}

### 注意此类问题在Go版本在1.22 版本后将会有变化

🔗:[修复 Go 1.22 中的 For 循环](https://go.dev/blog/loopvar-preview)

> Go >=1.22

```go
zhou => zhou
li => li
wang => wang
```

> Go < 1.22

```go
zhou => wang
li => wang
wang => wang
```

Go1.22版本前

```go
//将数组依次添加到map中
    for _, stu := range stus {
        m[stu.Name] = &stu
    }
```

这里stu的地址是相同的，因此每次循环m[stu.Name] 存储的值都是相同的。

{{< /togglecontent >}}
