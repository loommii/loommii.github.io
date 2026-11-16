# Go Daily Question 20250530


What is the output of the following code?
```go
package main

import "sync"

func main() {
	var wg sync.WaitGroup
	foo := make(chan int)
	bar := make(chan int)
	wg.Add(1)
	go func() {
		defer wg.Done()
		select {
		case foo <- <-bar:
		default:
			println("default")
		}
	}()
	wg.Wait()
}
```

{{< details summary="🔑 Answer Analysis:" >}}

## Correct Answer: **Deadlock (no output, program hangs)**

### Analysis:

This code will **deadlock**; it will not output "default" nor panic. Instead, the program will hang and cannot continue execution. The reasons are as follows:

1.  **`select` statement evaluation order**:
    - When entering `select`, Go first evaluates all case expressions in order.
    - For `case foo <- <-bar:`, `<-bar` (the right-hand side expression of the send operation) will be evaluated first.

2.  **Channel operation blocking**:
    - `bar` is an unbuffered channel, and no other goroutine is sending data to it.
    - `<-bar` will block indefinitely, waiting for data.
    - Since the `select` blocks during case expression evaluation, it never gets to check for a `default` case.
    - Thus, the `default` branch will not be executed.

4.  **Deadlock formation**:
    - The main goroutine is waiting at `wg.Wait()`.
    - The child goroutine is blocked during `select` evaluation.
    - There are no other goroutines that can unblock this state.
    - Eventually, all goroutines block, forming a deadlock.

### Verification method:
You can run this program and observe that it has no output and does not exit; instead, it hangs (deadlock state).

### Correct approach:
If you want to avoid a deadlock, you should ensure that channel operations do not block during evaluation, for example:
```go
select {
case v := <-bar:  // Receive separately first
    foo <- v      // Then send
default:
    println("default")
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250530/  

