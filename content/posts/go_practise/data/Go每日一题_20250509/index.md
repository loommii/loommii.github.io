---
date: '2025-05-09T13:53:06+08:00'
draft: false
title: 'Go每日一题_20250509'
---
通常，JS 面试，闭包应该是必考的题目。随着越来越多的语言对函数式范式的支持，闭包问题经常出现。在 Go 语言中也是如此。

这是 Go 语言爱好者周刊第 90 期的一道题目。以下代码输出什么？
```go
package main

import "fmt"

func app() func(string) string {
	t := "Hi"
	c := func(b string) string {
		t = t + " " + b
		return t
	}
	return c
}

func main() {
	a := app()
	b := app()
	a("go")
	fmt.Println(b("All"))
	fmt.Println(a("All"))
}
```

{{< togglecontent label="🔑 答案解析：" >}}

闭包
    fmt.Println(b("All")) 输出  A （Hi All）
    fmt.Println(a("All")) 输出  B  （Hi go All）

```go
package main

import "fmt"

func app() func(string) string {
	// 1. 每次调用 app() 时，都会创建一个新的、独立的局部变量 't'。
	//    它的初始值是 "Hi"。
	t := "Hi"

	// 2. 定义一个匿名函数（闭包 'c'）。
	//    这个闭包 'c' "捕获"其外部作用域中的变量 't'。
	//    这意味着 'c' 持有对它创建时所在的 app() 函数作用域中的那个特定 't' 的引用。
	c := func(b string) string {
		// 3. 当闭包 'c' 被调用时，它会修改它所捕获的那个 't'。
		//    这个 't' 是在 'c' 被创建时就确定的 't'。
		t = t + " " + b
		return t
	}
	// 4. 返回这个闭包 'c'。
	return c
}

func main() {
	// 5. 第一次调用 app():
	//    - 在 app() 内部，创建了一个 't' (我们称之为 t_for_a)，初始值为 "Hi"。
	//    - 创建了一个闭包，这个闭包捕获了 t_for_a。
	//    - 这个闭包被赋值给变量 'a'。
	//    - 所以，'a' 现在是一个函数，它内部保留了对 t_for_a 的引用。
	a := app() // 此时，'a' 绑定的 't' (t_for_a) 的值是 "Hi"

	// 6. 第二次调用 app():
	//    - 再次在 app() 内部，创建了另一个 *全新的、独立的* 't' (我们称之为 t_for_b)，初始值也为 "Hi"。
	//    - 创建了另一个 *全新的、独立的* 闭包，这个闭包捕获了 t_for_b。
	//    - 这个闭包被赋值给变量 'b'。
	//    - 所以，'b' 现在是一个函数，它内部保留了对 t_for_b 的引用。
	//    - 关键点：t_for_a 和 t_for_b 是两个完全不同的内存位置上的变量。
	b := app() // 此时，'b' 绑定的 't' (t_for_b) 的值是 "Hi"。
	// 'a' 绑定的 't' (t_for_a) 的值仍然是 "Hi"，不受影响。

	// 7. 调用闭包 'a'，并传入参数 "go":
	//    - 'a' 内部的 t_for_a 被修改：t_for_a = "Hi" + " " + "go"  =>  t_for_a 变为 "Hi go"。
	//    - a("go") 的返回值是 "Hi go"，但这里没有使用这个返回值。
	a("go") // 执行后：t_for_a = "Hi go"。 t_for_b 仍然是 "Hi"。

	// 8. 调用闭包 'b'，并传入参数 "All":
	//    - 'b' 内部的 t_for_b 被修改：t_for_b = "Hi" + " " + "All"  =>  t_for_b 变为 "Hi All"。
	//    - b("All") 的返回值是 "Hi All"。
	fmt.Println(b("All")) // 输出: Hi All
	// 执行后：t_for_a = "Hi go"。 t_for_b = "Hi All"。

	// 9. 再次调用闭包 'a'，并传入参数 "All":
	//    - 'a' 内部的 t_for_a (当前值为 "Hi go") 被修改：t_for_a = "Hi go" + " " + "All"  =>  t_for_a 变为 "Hi go All"。
	//    - a("All") 的返回值是 "Hi go All"。
	fmt.Println(a("All")) // 输出: Hi go All
	// 执行后：t_for_a = "Hi go All"。 t_for_b = "Hi All"。
}

/*
输出是什么？ 这里考的是go闭包的问题

最终输出：
Hi All
Hi go All
*/
```

{{< /togglecontent >}}
