# Go Daily Question 20250527


Process of sending and receiving data on a channel

{{< details summary="🔑 Answer Analysis:" >}}

- Sending data
	- Uninitialized channels will deadlock.
	- Closed channels will panic.
	- If a blocked Goroutine is waiting to read, data is written and the reader is unblocked.
	- If no blocked reader exists, and the channel is buffered, it checks for available space. If space exists, data is written to the buffer.
	- If the buffer is full, the sender blocks.
- Receiving data
	- Uninitialized channels will deadlock.
	- Closed channels will return the zero value.
	- Unbuffered:
		- If a blocked Goroutine is waiting to write, data is read and the writer is unblocked.
	- Buffered: checks if there's available space. If no content, the receiver Goroutine blocks and is added to the read queue. If content exists, data is read from the buffer.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250527/  

