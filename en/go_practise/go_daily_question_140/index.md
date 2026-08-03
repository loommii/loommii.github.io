# Go Daily Question 140


What is the output of the following code?

```go
func main() {  
    var i interface{}
    if i == nil {
        fmt.Println("nil")
        return
    }
    fmt.Println("not nil")
}
```

- A. nil
- B. not nil
- C. compilation error
{{< details summary="🔑 Answer Analysis:" >}}

A [Run online](https://go.dev/play/p/rtD7YmJZxp1)

Simply put, an interface variable has two values: one is its type, and the other is its value.
For an `if` interface, the `live() == nil` condition is true only when both the value and the type are zero values.

## Internal Structure of `interface`

An interface has two forms of representation:

```go
// 1. Empty interface
var MyInterface interface{}
// 2. Non-empty interface
type MyInterface interface {
    function()
}
```

Correspondingly, there are two underlying structures:

- Empty interface

```go
type eface struct {      // Empty interface
    _type *_type         // Type information
    data  unsafe.Pointer // Pointer to data (special pointer type unsafe.Pointer in Go, similar to void* in C)
}
type _type struct {
    size       uintptr // Size of the type
    ptrdata    uintptr // Size of memory holding all pointers in the prefix
    hash       uint32  // Data hash value
    tflag      tflag
    align      uint8   // Alignment
    fieldalign uint8   // Alignment when embedded in a struct
    kind       uint8   // Kind (some enum values, kind == 0 is invalid)
    // function for comparing objects of this type
    // (ptr to object A, ptr to object B) -> ==?
    equal     func(unsafe.Pointer, unsafe.Pointer) bool
    gcdata    *byte
    str       nameOff
    ptrToThis typeOff
}
```

`_type` attribute: is a common description for all types in Go. Almost all data structures in Go can be abstracted as `_type`. It is a common description for all types, and `_type` is responsible for determining how `data` should be interpreted and operated on.
`data` attribute: represents a pointer to the specific instance data. It is of type `unsafe.Pointer`, equivalent to a generic `void*` pointer in C.

- Non-empty interface

```go
/// Non-empty interface
type iface struct {
  tab  *itab
  data unsafe.Pointer
}
type itab struct {
  inter  *interfacetype   // Meta-information about the interface itself
  _type  *_type           // Meta-information about the concrete type
  hash   int32            // There is also an identical hash in _type; having it here facilitates interface assertion
  _      [4]byte
  fun    [1]uintptr       // Function pointer, pointing to the method implemented by the concrete type
}

// `itab` contains some key information about the interface, such as the concrete implementation of methods.
```

1.  `interface type` contains information about the interface itself, such as package path and included methods. Here, `interfacetype` is an abstract representation of an interface definition.
2.  `_type` represents the concretized type, which is the same as the `_type` in `eface`.
3.  The `hash` field is actually a copy of `_type.hash`. It is used during interface instantiation to quickly determine if the target type and the type in the interface are consistent. Also, Go's interface Duck-typing mechanism relies on this field.
4.  The `fun` field is actually a dynamically sized array. Although declared with a fixed size of 1, when used, data is directly retrieved via the `fun` pointer, and array boundaries are not checked. Therefore, the number of elements stored in this array is uncertain.

## Back to this problem

`i` belongs to an empty interface, and both its type information and the pointer to its data are zero values (`nil`).
At this point, `i == nil` is true.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_140/  

