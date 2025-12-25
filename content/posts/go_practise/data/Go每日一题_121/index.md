---
date: '2024-12-06T23:43:04+08:00'
draft: false
title: 'Go每日一题_121'
---
下面代码会输出什么

```go
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
```

{{< togglecontent label="🔑 答案解析：" >}}
0
1
上方2个函数的区别在于increaseA() 的返回参数是匿名，increaseB() 是具名。
A 执行到return i 是将i的值赋值给返回参数，后面i++不影响
B 执行到return r 是将r赋值给r,后面的r++ 因为是同一个r 后面的r++会影响

```go
func increaseB() (r int) {
    defer func() {
        r++
    }()
    return 4
}
// 返回5
```

上面的代码就可以证明return 4 赋值给了r

{{< /togglecontent >}}
