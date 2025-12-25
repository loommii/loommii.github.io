---
date: '2024-12-23T17:13:47+08:00'
draft: true
title: '855_考场就座'
---
力扣链接:[855. 考场就座](https://leetcode.cn/problems/exam-room/description/)

> 力扣难度 `中等`
>
> 算法评级:  7      结合多方面的数据结构和算法，处理较复杂问题
>
> 难度分 2067

---
题目：

在考场里，有 n 个座位排成一行，编号为 0 到 n - 1。

当学生进入考场后，他必须坐在离最近的人最远的座位上。如果有多个这样的座位，他会坐在编号最小的座位上。(另外，如果考场里没有人，那么学生就坐在 0 号座位上。)

设计一个模拟所述考场的类。

实现 ExamRoom 类：

- ExamRoom(int n) 用座位的数量 n 初始化考场对象。
- int seat() 返回下一个学生将会入座的座位编号。
- void leave(int p) 指定坐在座位 p 的学生将离开教室。保证座位 p 上会有一位学生。

---

```go
type ExamRoom struct {
    
}


func Constructor(n int) ExamRoom {
    
}


func (this *ExamRoom) Seat() int {
    
}


func (this *ExamRoom) Leave(p int)  {
    
}


/**
 * Your ExamRoom object will be instantiated and called as such:
 * obj := Constructor(n);
 * param_1 := obj.Seat();
 * obj.Leave(p);
 */
```

{{< togglecontent label="🔑 答案解析： 👈点击" >}}

```go
func sortTheStudents(score [][]int, k int) [][]int {
    slices.SortFunc(score, func(a, b []int) int { return b[k] - a[k] })
    return score
}
```

{{< /togglecontent >}}
