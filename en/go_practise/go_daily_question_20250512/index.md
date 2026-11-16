# Go Daily Question 20250512


What is the output of the following code?

```go
type Person struct {
	age int
}

func main() {
	person := &Person{28}

	// 1.
	defer fmt.Println(person.age)

	// 2.
	defer func(p *Person) {
		fmt.Println(p.age)
	}(person)

	// 3.
	defer func() {
		fmt.Println(person.age)
	}()

	person = &Person{29}
}
```
{{< details summary="🔑 Answer Analysis:" >}}

**Answer Analysis:**

Reference Answer and Analysis: `29` `28` `28`.

This problem makes a small modification based on a previous problem. In the previous problem, the last line of code `person.age = 29` modified the `age` member of the referenced object. In this problem, the last line of code `person = &Person{29}` modifies the referenced object itself. Let's see what the difference is.

1.  The line `person.age` has the same meaning as before. Here, `28` is passed as a parameter to the `defer` function, and `28` is cached on the stack. When this `defer` statement is finally executed, `28` is retrieved, meaning it outputs `28`;
2.  The `defer` caches the address of the `Person{28}` struct. The struct pointed to by this address has not changed. When the function after the `defer` statement is finally executed, it still retrieves `28`;
3.  Closure reference: The value of `person` has been changed, now pointing to the `Person{29}` struct, so it outputs `29`.

Since the execution order of `defer` is **Last-In, First-Out** (LIFO), i.e., `3` `2` `1`, the output is `29` `28` `28`.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250512/  

