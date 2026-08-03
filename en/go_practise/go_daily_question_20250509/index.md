# Go Daily Question 20250509


Usually, closure questions are a must-have in JS interviews. With more and more languages supporting the functional paradigm, closure problems frequently appear. The same is true in Go.

This is a problem from Go Language Enthusiasts Weekly #90. What is the output of the following code?
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

{{< details summary="🔑 Answer Analysis:" >}}

Closure
    `fmt.Println(b("All"))` outputs A (Hi All)
    `fmt.Println(a("All"))` outputs B (Hi go All)

```go
package main

import "fmt"

func app() func(string) string {
	// 1. Each time app() is called, a new, independent local variable 't' is created.
	//    Its initial value is "Hi".
	t := "Hi"

	// 2. Defines an anonymous function (closure 'c').
	//    This closure 'c' "captures" the variable 't' from its outer scope.
	//    This means 'c' holds a reference to that specific 't' within the scope of the app() function where it was created.
	c := func(b string) string {
		// 3. When the closure 'c' is called, it modifies the 't' it captured.
		//    This 't' is the 't' that was determined when 'c' was created.
		t = t + " " + b
		return t
	}
	// 4. Returns this closure 'c'.
	return c
}

func main() {
	// 5. First call to app():
	//    - Inside app(), a 't' is created (let's call it t_for_a), with an initial value of "Hi".
	//    - A closure is created, and this closure captures t_for_a.
	//    - This closure is assigned to variable 'a'.
	//    - So, 'a' is now a function that internally retains a reference to t_for_a.
	a := app() // At this point, the value of 't' (t_for_a) bound to 'a' is "Hi"

	// 6. Second call to app():
	//    - Again inside app(), another *brand new, independent* 't' is created (let's call it t_for_b), also with an initial value of "Hi".
	//    - Another *brand new, independent* closure is created, and this closure captures t_for_b.
	//    - This closure is assigned to variable 'b'.
	//    - So, 'b' is now a function that internally retains a reference to t_for_b.
	//    - Key point: t_for_a and t_for_b are two completely different memory locations.
	b := app() // At this point, the value of 't' (t_for_b) bound to 'b' is "Hi".
	// The value of 't' (t_for_a) bound to 'a' is still "Hi", unaffected.

	// 7. Call closure 'a', passing "go" as argument:
	//    - t_for_a inside 'a' is modified: t_for_a = "Hi" + " " + "go"  =>  t_for_a becomes "Hi go".
	//    - The return value of a("go") is "Hi go", but it's not used here.
	a("go") // After execution: t_for_a = "Hi go". t_for_b is still "Hi".

	// 8. Call closure 'b', passing "All" as argument:
	//    - t_for_b inside 'b' is modified: t_for_b = "Hi" + " " + "All"  =>  t_for_b becomes "Hi All".
	//    - The return value of b("All") is "Hi All".
	fmt.Println(b("All")) // Output: Hi All
	// After execution: t_for_a = "Hi go". t_for_b = "Hi All".

	// 9. Call closure 'a' again, passing "All" as argument:
	//    - t_for_a inside 'a' (current value "Hi go") is modified: t_for_a = "Hi go" + " " + "All"  =>  t_for_a becomes "Hi go All".
	//    - The return value of a("All") is "Hi go All".
	fmt.Println(a("All")) // Output: Hi go All
	// After execution: t_for_a = "Hi go All". t_for_b = "Hi All".
}

/*
What is the output? This tests Go closures.

Final Output:
Hi All
Hi go All
*/
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250509/  

