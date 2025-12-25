---
date: '2024-12-06T19:49:56+08:00'
draft: false
title: 'Go每日一题_023'
---
通过指针变量 p 访问其成员变量 name，有哪几种方式？（多选）

```
A.p.name
B.(&p).name
C.(*p).name
D.p->name
```

{{< togglecontent label="🔑 答案解析：" >}}
答:
 AC
& 取址运算符，*指针解引用。
p 是指针变量, 因此可以使用*指针解引用
Go有语法糖,直接使用 指针变量.成员变量 也是可以访问的
{{< /togglecontent >}}
