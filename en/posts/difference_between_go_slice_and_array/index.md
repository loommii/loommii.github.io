# Go: Slices vs. Arrays


<!--more-->
## Underlying Structure

### Array

An array is a fixed-length, numbered sequence of elements of a single type.

Keywords: Same type, Fixed length, Sequence

![Go Array Structure](go-array-structure.png)

### Slice

```go
type SliceHeader struct {
    Data uintptr // Pointer to the underlying array
    Len  int     // Length of the slice
    Cap  int     // Capacity of the slice
}
```

A Go slice is a flexible and powerful abstraction built on top of an array. The slice header structure contains a pointer to an underlying array, a length, and a capacity.

## Initialization

### Array

```go
var numbers [5]int // Declares an array of length 5; its elements are initialized with their zero value (0 for int).
var numbers = [5]int{1, 2, 3, 4, 5} // Declares and initializes an array of length 5 with the specified values.
numbers := [5]int{1, 2, 3} // The remaining elements are initialized with their zero value. Result: [1 2 3 0 0].
numbers := [5]int{1, 2, 3, 4, 5, 6} // Compilation fails because there are more initializers than the array length.
numbers := [...]int{1, 2, 3, 4, 5, 6} // The compiler infers the array's length from the number of elements. Length becomes 6.
numbers := [...]int{1: 1} // The compiler infers the length from the highest index, which is 1. Length becomes 2. Result: [0 1].

numbers := [...]int{5: 1, 2, 3, 1: 11}
// `5: 1, 2, 3` initializes elements at indices 5, 6, and 7 with values 1, 2, and 3.
// `1: 11` initializes the element at index 1 with the value 11.
// The final array is `[0 11 0 0 0 1 2 3]`.
```

### Slice

```go
s := []int{1, 2, 3} // Creates a slice with length 3 and capacity 3, content is [1 2 3]
numbers := []int{5: 1, 2, 3, 1: 11}
//  5: 1, 2, 3 means start at index 5 with values 1, 2, 3
//  1: 11 means start at index 1 with value 11
//  Result: [0 11 0 0 0 1 2 3]
```

Creating slices using the `make()` function:

```go
s := make([]T, length, capacity) // T is the type, length is the length, capacity is the capacity
s := make([]T, length) // T is the type, length is both the length and capacity

s := make([]int, 3, 4) // Creates a slice with length 3 and capacity 4, content is [0 0 0]
s := make([]int, 4) // Creates a slice with length 4 and capacity 4, content is [0 0 0 0]
s := make([]int, 4, 3) // Compilation fails because capacity is less than length
```

## Equality Comparison

### Array

1.  Relational operator `==`: Arrays of the same length and type can be compared using `==`.

```go
[2]int{1, 2} == [2]int{1, 2} // true
[3]int{1, 2} == [2]int{1, 2} // Compilation fails, [3]int and [2]int are different types
```

2.  Using `reflect.DeepEqual` to check equality.

```go
reflect.DeepEqual([2]int{1, 2}, [2]int{1, 2})
```

### Slice

1.  Relational operator `==`: Slices can only be compared with `nil`.

```go
[]int{1, 2} == []int{1, 2} // Compilation fails; slices are not comparable with `==` (only to `nil`).
[]int{} == nil // false. An empty slice literal creates a non-nil slice with a length and capacity of 0.

var a []int
a == nil // true. The zero value of a slice is `nil`.
```

2.  Using `reflect.DeepEqual` to check equality.

```go
reflect.DeepEqual([]int{1, 2}, []int{1, 2, 0})
```

### Slice Growth

### Array

Arrays have a fixed length and cannot be resized.

### Slice

Slices can be extended by using the built-in `append` function. If adding new elements exceeds the slice's current capacity, the slice will grow automatically.

When a slice grows, the Go runtime allocates a new, larger underlying array and copies all the elements from the old array to the new one.

The growth strategy has evolved, but for modern Go versions (1.18+), the logic is generally as follows:
- For slices with a capacity of less than 1024 elements, the new capacity will be double the old capacity.
- For larger slices, the new capacity will grow by a factor of approximately 1.25 (or 25%) each time.

This geometric growth ensures that `append` operations have an amortized constant time complexity, making them very efficient over many appends.

### Summary

1.  **Mutability**: Arrays have a fixed length defined at compile time. Slices are dynamic and can grow or shrink at runtime.
2.  **Value vs. Reference Semantics**: Arrays are value types. When you pass an array to a function, a copy of the entire array is made. Slices are like reference types; when you pass a slice, a copy of the slice header is made, but both the original and the copy point to the *same* underlying array.
3.  **Comparison**: Arrays of the same type and length can be compared for equality using the `==` operator. Slices can only be compared to `nil`.
4.  **Pointers and Memory**: A slice is a lightweight struct (a header) that describes a contiguous section of a backing array. Multiple slices can share the same underlying array, making them efficient to pass and use.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/difference_between_go_slice_and_array/  

