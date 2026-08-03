# An Overview of Go GC (Garbage Collection)


<!--more-->

## Garbage Collection

1.  What does the "garbage" in garbage collection refer to, and why does it need to be recycled?
    When a program runs, the process applies for memory space in the heap. However, when a function exits, the stack space is destroyed. Therefore, this segment of heap memory space has no pointers pointing to it (no references). This causes memory waste (memory leak). This segment of unreferenced memory is "garbage". Programmers no longer need to manually manage memory allocation and deallocation, reducing issues like memory leaks or dangling pointers caused by improper memory management.

2.  What are the common types of GC?
    -   Manual garbage collection, representative languages (C, C++)
    -   Mark-and-Sweep algorithm
        -   Tri-color marking
    -   Mark-and-Compact algorithm
        -   Moving Compaction
        -   Copying Compaction
    -   Generational Collection
    -   Reference Counting
3.  Briefly describe how common GCs are implemented and their respective advantages and disadvantages.
    -   Manual garbage collection:
        -   Implementation: Programmers call functions to destroy manually.
        -   Advantages: Programmers have free control over program memory.
        -   Disadvantages: Prone to issues like premature release (dangling pointers) and forgetting to release (memory leaks).
    -   Mark-and-Sweep:
        -   Implementation: Mark data reachable from root nodes (stack memory, data segments) as live data. Other unmarked data is garbage data, which is then reclaimed.
        -   Advantages: Relatively simple implementation.
        -   Disadvantages: Prone to causing memory fragmentation.
    -   Mark-and-Compact:
        -   Implementation:
            -   The marking phase is consistent with the `Mark-and-Sweep algorithm`.
            -   The compaction phase:
                -   Moving Compaction: Compact and move useful data to make the useful data as tight as possible in memory.
                    -   Advantages: Solves the problem of memory fragmentation.
                    -   Disadvantages: Multiple scans and moves bring considerable performance overhead.
                -   Copying Compaction: Divide memory into From and To spaces. Copy all useful data from the From space to the To space. Then swap the roles of the From and To spaces.
                    -   Advantages: Solves the performance problem of multiple scan and move operations.
                    -   Disadvantages: Low memory utilization. Only half of the heap memory space is used.
    -   Generational Collection:
        -   Implementation: Based on the `weak generational hypothesis`. Data is divided into young generation and old generation. Different collection algorithms are used for the young and old generations.
    -   Reference Counting
        -   Implementation: Update the object's reference count every time the object is referenced. When the reference count is 0, reclaim the space.
        -   Advantages: Can reclaim garbage memory in a timely manner.
        -   Disadvantages: High-frequency updates to the reference count incur considerable performance overhead. Circular references can cause the reference count to never reach 0.

4.  What is STW, and why does STW exist?
    STW (Stop The World) simply means stopping the user program.
    ![b1bb8a580c1de4ba490fe1787b9b4484.png](./b1bb8a580c1de4ba490fe1787b9b4484.png)
    During STW, the program performs garbage collection.

## STW

    STW is an abbreviation for Stop-The-World, referring to the behavior of pausing all application threads during garbage collection or certain system operations until a specific task (usually garbage collection) is completed.
![e6d686db23ff699d03219905d8ceb2c1.png].(/e6d686db23ff699d03219905d8ceb2c1.png)
This brings up a question: Would user programs accept long periods of STW?
To solve this problem, `Incremental Garbage Collection` emerged.

## Incremental Garbage Collection

![61ac2ddfdd0b562c9d1dc2db48226baf.png](./61ac2ddfdd0b562c9d1dc2db48226baf.png)
Implementation: Divide one GC into multiple parts and perform them interactively with the user program.
Advantages: Solves the problem of long STW times.
Disadvantages: If content is created between the marking and cleaning phases, it might be incorrectly deleted.

To avoid incorrect deletion, `Tri-color Abstraction` can be adopted.
Tri-color Abstraction: Marked data is divided into Black - Gray - White.

-   Black: Data that has been traversed and marked.
-   Gray: Data that has not yet been fully traversed.
-   White: Garbage data that has not been traversed (unreachable).

Therefore, during the sweeping phase, if Black -> White data is found, this white data was created between the marking and cleaning phases.
![ec4f1ac56d59908315538e9aaab07d06.png](./ec4f1ac56d59908315538e9aaab07d06.png)
Therefore, the official Golang proposes 2 conditions:

-   Strong Tri-color Invariant: Does not allow Black to White situations.
![e4c3408593ec24f14daa8c47feb3fdd4.png](./e4c3408593ec24f14daa8c47feb3fdd4.png)
-   Weak Tri-color Invariant: Allows Black to White situations, but this white must be referenced by gray.
![84ad5e2babcccd8c8b5a1c5c7d3b1260.png](./84ad5e2babcccd8c8b5a1c5c7d3b1260.png)

Write Barrier

-   Insertion Write Barrier
    -   Satisfies the `Strong Tri-color Invariant` condition (focuses on write operations to white objects).
        -   In incremental garbage collection, if a white object points to black, change the white object to gray, or change the black to gray.
        -   Example: During the alternation of GC and user code, suppose a new space is created (Black -> White). Then this new space is directly marked as gray (Black -> Gray) or change black to gray (Gray -> White).
-   Deletion Write Barrier
    -   Satisfies the `Weak Tri-color Invariant` condition (focuses on the destruction of white object paths).
        -   In incremental garbage collection, if the gray -> white reference is deleted, change the white object to gray.
        -   Example: During the alternation of GC and user code, if there is a gray object -> white object, and the program sets the gray object = nil, then the white object needs to be changed to gray.

Read Barrier
    Solves the issue in Mark-and-Copy GC during the copying process. When the collector changes From to To. If you want to read From, you need to check if it has already been copied to the To area. If it hasn't been copied over, go to To.
    ![c135848c4e9bd0ee8282490baeeb81d1.png](./c135848c4e9bd0ee8282490baeeb81d1.png)

## Multi-core Situations

-   Parallel Garbage Collection
    -   ![532396cd165431d498045e6aed39e155.png](./532396cd165431d498045e6aed39e155.png)
    -   Pay attention to synchronization issues.
-   Concurrent Garbage Collection
    -   ![6b106fbad41ec47190bc8da181a6fe6e.png](./6b106fbad41ec47190bc8da181a6fe6e.png)
    -   Solves synchronization issues, but pay attention to the problem of notifying to enable read/write barriers.
-   Main-thread Parallel Garbage Collection
    -   ![ab5682e6c6be5bf233a99a4f42ba8c02.png](./ab5682e6c6be5bf233a99a4f42ba8c02.png)
    -   Solves the problem of inconsistent timing for notifying to enable read/write barriers.
-   Main-thread Parallel Incremental Garbage Collection
    -   ![8a3000100eb87a16c06de8e313d29e83.png](./8a3000100eb87a16c06de8e313d29e83.png)

## Go Language's GC

-   Uses the Mark-and-Sweep algorithm.
    -   Uses tri-color marking in the marking phase.
-   Main-thread Parallel Incremental Garbage Collection.
-   Uses a hybrid write barrier combining Insertion and Deletion Write Barriers.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/a_brief_discussion_on_go_gc_garbage_collection/  

