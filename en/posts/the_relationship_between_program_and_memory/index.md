# The Relationship Between Programs and Memory


## The Relationship Between Programs and Memory

<!--more-->

1.  Essence of data types: Aliases for fixed memory sizes.
2.  Role of data types: Compiler estimates the memory space size allocated for objects (variables).
3.  Four memory regions: Stack region, Heap region, Global region - Static global variables, Global region - Constant area.

### Runtime Flow Description

1.  The operating system loads the code from the physical hard disk into memory.
2.  The operating system divides the code into four regions.
3.  The operating system finds the main function entry point to execute.

### Four Memory Regions

-   Stack Region: Smaller space, requires high data read/write performance, and data storage time is relatively short. Allocated and freed automatically by the compiler, storing function parameter values, function call flow method addresses, local variables, etc. (If local variables exhibit escape phenomena, they might be placed in the heap region).
-   Heap Region: Ample space, data storage time is relatively long. Generally allocated and freed by the developer (However, in Golang, depending on the variable's escape phenomenon, it chooses whether to allocate on the stack or heap). Starting Golang's GC, the memory is automatically reclaimed by the GC clearing mechanism.
-   Global Region - Static Global Variables: The allocation of global variables occurs in memory before the program's main function starts. And it is completely visible externally. That is, the scope is in all code, and any code in the same package can be used at any time. Variables can be confusing, and in local functions, if variables with the same name use `:=` for assignment, a compilation error will occur.
    Global variables are ultimately reclaimed by the operating system when the process exits.
-   Global Region - Constant Area: The constant area also belongs to the global region. Constants are units for storing numeric literal values, i.e., they are immutable. Or, some constants are directly tied to literal values.

For example:

```go
const cl = 10
```

`cl` is an equivalent symbol for the literal value `10`.

Therefore, in Golang, constants cannot have their address taken, because literal symbols do not inherently possess an address.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/the_relationship_between_program_and_memory/  

