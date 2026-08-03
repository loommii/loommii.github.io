# Go: What Happens With Uninitialized Slice and Map Operations?


<!--more-->

## Underlying Structure

```go
// slice(切片)
type SliceHeader struct {
    Data uintptr // Address of the underlying array
    Len  int     // Length
    Cap  int     // Capacity
}

// map(集合)
type hmap struct {
    // Note: the format of the hmap is also encoded in cmd/compile/internal/reflectdata/reflect.go.
    // Make sure this stays in sync with the compiler's definition.
    count     int // # live cells == size of map.  Must be first (used by len() builtin)
    flags     uint8
    B         uint8  // log_2 of # of buckets (can hold up to loadFactor * 2^B items)
    noverflow uint16 // approximate number of overflow buckets; see incrnoverflow for details
    hash0     uint32 // hash seed

    buckets    unsafe.Pointer // array of 2^B Buckets. may be nil if count==0.
    oldbuckets unsafe.Pointer // previous bucket array of half the size, non-nil only when growing
    nevacuate  uintptr        // progress counter for evacuation (buckets less than this have been evacuated)
    clearSeq   uint64

    extra *mapextra // optional fields
}
```

Both of these types are reference types, characterized by storing an address, and their zero value is `nil`.

Looking at the code above, you'll find that the underlying structures all contain addresses pointing to other memory spaces:

-   `slice` (`切片`) `Data` points to the underlying array.
-   `map` (`集合`) `buckets` stores buckets, `oldbuckets` stores old buckets, `mapextra` stores a linked list of overflow buckets and the starting address of unused overflow bucket arrays.

Therefore, if uninitialized, the pointed address will be `nil`.

## Slice (`切片`)

1.  Uninitialized Reads
    -   Specific Index

        At this point, the slice length and capacity are both 0. Reading by index will cause a panic (out of bounds).
    -   `for range`

        No content, will not panic. <https://go.dev/play/p/PlQgXmM7MKe>
2.  Uninitialized Writes
    -   Specific Index

        At this point, the slice length and capacity are both 0. Writing by index will cause a panic (out of bounds).
    -   `append`

        Will not panic, can write normally. <https://go.dev/play/p/wo6M-xCZ6XW>

## Map (`集合`)

1.  Uninitialized Reads
    -   Specific Key

        Will not panic, the read value will be the zero value. <https://go.dev/play/p/Fjd67YLcHj4>
    -   `for range`

        Will not panic, no content. <https://go.dev/play/p/h6U7522hWBv>
2.  Uninitialized Writes

    Will panic with `panic: assignment to entry in nil map`. <https://go.dev/play/p/S8xUziyKnLa>
3.  Uninitialized Deletions

    Will not panic. <https://go.dev/play/p/Be3SgjevDlA>

## Why does uninitialized Map writing panic, but slice (`切片`) does not?

1.  When appending to a slice, it checks if the capacity is exceeded. If it is, expansion occurs. The array address after expansion will no longer be `nil`.
2.  Maps also have an expansion mechanism, so why do they still panic?

```go
func mapassign(t *maptype, h *hmap, key unsafe.Pointer) unsafe.Pointer {
    if h == nil {
        panic(plainError("assignment to entry in nil map"))
    }
    // Details omitted
}
```

When creating a map, the `hash0` sentinel factor is set. If uninitialized, `hash0` will be 0. Performing operations that divide by `hash0` (e.g., `./0`) is not allowed.

## How to Avoid

1.  Introduce unit tests. Panics caused by uninitialized operations are predictable, so unit tests should be included in project development.
2.  Use `recover` to handle panics.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/what_happens_if_go_map_slice_is_not_initialized/  

