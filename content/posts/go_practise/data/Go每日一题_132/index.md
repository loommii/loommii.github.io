---
date: '2024-12-15T13:02:42+08:00'
draft: false
title: 'Go每日一题_132'
---
下面这段代码输出什么？

```go
type person struct {  
    name string
}

func main() {  
    var m map[person]int
    p := person{"mike"}
    fmt.Println(m[p])
}
```

{{< togglecontent label="🔑 答案解析：" >}}

答 0

未初始化的map 读0值 写panic

在线运行：
>读未初始化的map: <https://go.dev/play/p/yVjXasOREaH>
>
>写未初始化的map: <https://go.dev/play/p/2zmJGtrH-8v>
>
>写已初始化的map: <https://go.dev/play/p/eUh6csag8rh>

{{< /togglecontent >}}
