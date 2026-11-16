# Go每日一题_058


下面代码输出什么？

```go
func incr(p *int) int {
    *p++
    return *p
}

func main() {
    p :=1
    incr(&p)
    fmt.Println(p)
}
```

- A. 1
- B. 2
- C. 3

{{< details summary="🔑 答案解析：" >}}

答案：B。

知识点：指针，incr() 函数里的 p 是 *int 类型的指针，指向的是 main() 函数的变量 p 的地址。 第 2 行代码是将该地址的值执行一个自增操作，incr() 返回自增后的结果。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_058/  

