# Go每日一题_006

下面这段代码有什么缺陷：

```go
func sum(x, y int)(total int, error) {
    return x+y, nil
}
```

{{< details summary="🔑 答案解析：" >}}

答案:``(total int, error)`` 第二个返回值error没有命名

解析:
在函数有多个返回值时，只要有一个返回值有命名，其他的也必须命名。
``func sum(x, y int)(total int,err error) {``如果有多个返回值必须加上括号()；
``func sum(x, y int)(total int,err error)``
``func sum(x, y int)int``如果只有一个返回值且命名也必须加上括号()。``func sum(x, y int)(total int) {``

这里的第一个返回值有命名 total，第二个没有命名，所以错误。

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/go_practise/go_daily_question_006/  

