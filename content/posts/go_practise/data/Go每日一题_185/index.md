---
date: '2025-02-14T00:33:09+08:00'
draft: false
title: 'Go每日一题_185'
---
关于switch语句，下面说法正确的有?

- A. 条件表达式必须为常量或者整数；
- B. 单个case中，可以出现多个结果选项；
- C. 需要用break来明确退出一个case；
- D. 只有在case中明确添加fallthrough关键字，才会继续执行紧跟的下一个case；

{{< togglecontent label="🔑 答案解析：" >}}

BD

A 错误,条件不限于常量或整数  
B 正确,case中可以出现多个结果选项  

```go
case "apple", "banana":
    fmt.Println("Fruit")
```

C 错误 Go语言不需要break
D 正确

```go
case 1:
    fmt.Println("1")
    fallthrough  // 会继续执行下一个case
case 2:
    fmt.Println("2")
```

{{< /togglecontent >}}
