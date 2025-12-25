---
date: '2025-01-19T19:27:29+08:00'
draft: false
title: 'Go每日一题_166'
---
昨天只有3个G，如果把G的个数变为257个输出结果是怎么样

```go
package main

import (
    "fmt"
    "runtime"
    "sync"
)

func main() {
    runtime.GOMAXPROCS(1)

    var wg sync.WaitGroup
    wg.Add(257)
    for i := 1; i <= 257; i++ {
        go func(i int) {
            fmt.Println(i)
            wg.Done()
        }(i)
    }
    wg.Wait()
}
```

{{< togglecontent label="🔑 答案解析：" >}}

[在线运行](https://go.dev/play/p/pizDb_St91u)

```
257
1
2
3
...
255
256
```

结果和 3个G的一致，应为本地 runq 长度上线是256 ，257G 添到P的时候 会进入 runnext区（弹夹上限256但是可以上膛一颗。因此最多257）

{{< /togglecontent >}}
