# Go: GPM Quantity Limits


<!--more-->

## G

Abstraction of Coroutines

Goroutine (go /ruːˈtiːn/, homophone Go as in "routine") is a superior "coroutine" optimized by Golang.

### G Limits

There are no language-level restrictions, but theoretically, it is limited by machine memory. Each Goroutine occupies approximately 4KB of memory space upon creation.

Note: The 2-4KB required for Goroutine creation needs to be a contiguous memory block.

## M

Abstraction of System Threads

In Go's concurrency model, G (Goroutine) is a lightweight execution unit that needs to be executed by a system thread (M).
Each G is mapped to an available M. M is an operating system-level thread responsible for actual CPU execution.

### M Limits

M can be set using the `SetMaxThreads` function in the `runtime/debug` package. The default value is 10,000 threads.
[Official Documentation](https://pkg.go.dev/runtime/debug#SetMaxThreads)
>SetMaxThreads sets the maximum number of operating system threads that a Go program can use. If the program attempts to use more than this many threads, the program crashes. SetMaxThreads returns the previous setting. The initial setting is 10,000 threads.
>
>This limit controls the number of operating system threads, not the number of goroutines. A Go program creates a new thread only when a goroutine is ready to run, but all existing threads are blocked in a system call, a cgo call, or locked to another goroutine using runtime.LockOSThread.
>
>SetMaxThreads is primarily intended to limit the impact of programs that create an unlimited number of threads. Its purpose is to terminate the program before it overwhelms the operating system.

## P

P stands for processor, which is the scheduler in Golang.

P is the hub of GPM, connecting G and M to achieve a dynamic and organic combination between them.

### P Limits

1.  GOMAXPROCS environment variable limit.
2.  The value of P can be set via `runtime.GOMAXPROCS()`, with a default value equal to the number of CPU (logical) cores.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/go_gpm_quantity_limit/  

