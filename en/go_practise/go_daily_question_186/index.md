# Go Daily Question 186


Differences between Arrays and Slices

{{< details summary="🔑 Answer Analysis:" >}}

1.  **Structural Comparison**: A slice's structure consists of three parts: length, capacity, and underlying array. An array's structure is a contiguous block of memory.
2.  **Functional Comparison**: Slices are relatively flexible and support dynamic resizing based on capacity. The capacity of an array is fixed.
3.  **Restriction Comparison**: Arrays of the same type and capacity can be compared using the `==` operator, while slices cannot.

Frequently cited resource 🔗:[Differences between Arrays and Slices](https://golang.design/go-questions/slice/vs-array/)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_186/  

