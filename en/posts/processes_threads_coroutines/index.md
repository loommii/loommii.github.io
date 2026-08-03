# Processes, Threads, and Coroutines


> In terms of computer architecture, these concepts range from largest to smallest: `Program -> Process -> Thread -> Coroutine`.

<!--more-->

## Basic Concepts

- Process: The basic unit for system resource allocation and scheduling.
- Thread: The basic unit for CPU scheduling and execution.
- Coroutine: Also known as a user-level thread or micro-thread.

## Core Points

### Process

1.  The basic unit for operating system resource allocation.
2.  A process is the fundamental unit that can run independently and acquire resources on its own.

### Thread

1.  The smallest schedulable unit in the operating system.
2.  Creation, destruction, and scheduling are handled by the kernel. The CPU must switch between user mode and kernel mode.
3.  Can fully utilize multiple cores to achieve parallelism.

### Coroutine

1.  Uses an M:1 mapping with threads (many coroutines to one thread).
2.  Creation, destruction, and scheduling happen in user mode, making it transparent to the kernel and therefore lightweight.
3.  Runs within the same kernel thread and cannot execute in parallel; blocking one coroutine causes all coroutines in the same thread to become blocked.

Analogy:
Think of the CPU as electricity, a process as a factory, and a thread as a factory department.

Consider a scenario with one factory (process), one department (thread), and one power line (single core).
In this case, the electricity (single core) can be fully dedicated to one department (thread) within the factory (process).

However, if the workload becomes too large, the factory splits into two departments (threads) that work simultaneously. But with only one power line (single core), these departments must take turns using electricity (CPU time slices).

This creates another issue: switching power sources requires a qualified electrician (kernel) to operate, and each switch has significant overhead. To solve this, the factory keeps one department (thread) powered continuously, and workers from the original departments take turns working inside the powered department. Since this is personnel scheduling (user mode) within the factory, it doesn't involve the electrician (kernel mode). The switching cost is significantly reduced. This is essentially a coroutine.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/processes_threads_coroutines/  

