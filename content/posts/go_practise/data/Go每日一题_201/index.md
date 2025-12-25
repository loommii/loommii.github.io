---
date: '2025-03-02T13:56:51+08:00'
draft: false
title: 'Go每日一题_201'
---
new() 与 make() 的区别

{{< togglecontent label="🔑 答案解析：" >}}

new(T) 会为 T 类型的新值分配已置零的内存空间，并返回地址（指针），即类型为 *T 的值。换句话说就是，返回一个指针，该指针指向新分配的、类型为 T 的零值。适用于值类型，如数组、结构体等。

make(T,args) 返回初始化之后的 T 类型的值，这个值并不是 T 类型的零值，也不是指针 *T，是经过初始化之后的 T 的引用。make() 只适用于 slice、map 和 channel。

参考资料:

- 🔗📺️:[【Golang】slice类型存什么？make和new？slice和数组？扩容规则](https://www.bilibili.com/video/BV1CV411d7W8/?spm_id_from=333.999.0.0&vd_source=2efe9e7b9d8ada5878fa15a7ad28b0dd)

{{< /togglecontent >}}
