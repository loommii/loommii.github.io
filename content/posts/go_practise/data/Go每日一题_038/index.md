---
date: '2024-12-06T20:44:15+08:00'
draft: false
title: 'Go每日一题_038'
---
以下代码有什么问题？

```go
package main

import (
    "sync"
)

const N = 10

var wg = &sync.WaitGroup{}

func main() {
    for i := 0; i < N; i++ {
        go func(i int) {
            wg.Add(1)
            println(i)
            defer wg.Done()
        }(i)
    }
    wg.Wait()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答：输出结果不唯一，代码存在风险, 所有 go 语句未必都能执行到。
解析：

```go
var wg = &sync.WaitGroup{}
wg.Add(1)
wg.Done()
wg.Wait()
```

该用法类似一个栈,wg.Wait()判断wg中是否还有记录有的话堵塞直到栈为0才开始活跃。
这里的写法存在问题。wg.Add(1)被放到了协程中，导致存在未运行wg.Add(1)，wg.Wait()就已经判断结束了。
{{< /togglecontent >}}
