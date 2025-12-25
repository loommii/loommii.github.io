---
date: '2025-02-11T01:12:17+08:00'
draft: false
title: 'Go每日一题_182'
---
关于循环语句，下面说法正确的有（）

- A. 循环语句既支持 for 关键字，也支持 while 和 do-while；
- B. 关键字 for 的基本使用方法与 C/C++ 中没有任何差异；
- C. for 循环支持 continue 和 break 来控制循环，但是它提供了一个更高级的 break，可以选择中断哪一个循环；
- D. for 循环不支持以逗号为间隔的多个赋值语句，必须使用平行赋值的方式来初始化多个变量；

{{< togglecontent label="🔑 答案解析：" >}}

CD

### C

Go 支持带标签的 break，可指定中断外层循环：

```go
OuterLoop:
for i := 0; i < 5; i++ {
    for j := 0; j < 5; j++ {
        if someCondition {
            break OuterLoop // 直接跳出外层循环
        }
    }
}
```

### D

Go 支持带标签的 break，可指定中断外层循环：

```go
// ✅ 正确写法（平行赋值）
for i, j := 0, 1; i < 10; i, j = i+1, j*2 { ... }

// ❌ 错误写法（逗号分隔）
for i = 0, j = 1; i < 10; i++, j*=2 { ... }
```

### A❌ 错误

Go 语言只有 for 循环，没有 while 和 do-while 关键字，但可以通过 for 的变体模拟这两种循环。

### B❌ 错误

C/C++ 的 for 循环（需要括号）
Go多个赋值语句必须使用平行赋值的方式,C/C++ 逗号分隔的多变量初始化

{{< /togglecontent >}}
