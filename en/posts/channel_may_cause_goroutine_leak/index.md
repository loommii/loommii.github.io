# Go: Channel Might Lead to Goroutine Leaks


<!--more-->

## Channel Might Lead to Goroutine Leaks in Go

### Questions

#### What is a Goroutine Leak?

A Goroutine leak occurs when a Goroutine, after being created in a program, cannot terminate normally for some reason and is never garbage collected (GC). This prevents the resources occupied by the Goroutine (such as memory, stack space, etc.) from being released. Over time, this can exhaust system resources, leading to program crashes.

#### How can Channels cause Goroutine Leaks?

Channels are a crucial mechanism for synchronization and communication between Goroutines. However, improper use of Channels can lead to Goroutine blocking and eventual leaks. Here are common scenarios that cause leaks:

- **Sending Blockage**: A Goroutine attempts to send data to a full unbuffered Channel or a full buffered Channel. If no other Goroutine receives the data, the send operation will block.
- **Receiving Blockage**: A Goroutine attempts to receive data from an empty unbuffered Channel or an empty buffered Channel. If no other Goroutine sends data, the receive operation will block.

The reason for the leak is that after a goroutine operates on a channel, it enters a sending or receiving blocked state, and the channel remains full or empty, never changing. Simultaneously, the garbage collector will not reclaim such resources, causing the goroutine to remain in the waiting queue indefinitely.

### Code Example

```go
package main

import (
    "fmt"
    "runtime"
    "time"
)

func main() {
    ch := make(chan int) // Unbuffered Channel

    go func() {
        ch <- 1 // First send successful (Channel not full)
        fmt.Println("First send successful")
        ch <- 2 // Second send permanently blocked (Channel is full and no receiver)
        fmt.Println("Second send successful (will never execute)")
    }()

    time.Sleep(500 * time.Millisecond)
    fmt.Println("Received:", <-ch) // Consume data only once

    // Monitor Goroutine count
    for {
        fmt.Printf("Current Goroutine count: %d\n", runtime.NumGoroutine()) // 2
        time.Sleep(1 * time.Second)
    }
}
```

[Run Online](https://go.dev/play/p/ZY9038_1BYW)


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/channel_may_cause_goroutine_leak/  

