# Go: Are Maps Concurrency-Safe?


## Conclusion

Concurrent reads are safe, but concurrent writes are not safe.

<!--more-->

## Reason

```go
// map underlying structure
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
// bucket structure
type bmap struct {
    topbits  [8]uint8
    keys     [8]keytype
    values   [8]valuetype
    pad      uintptr
    overflow uintptr
}
```

From the `hmap` struct, we can see that the underlying implementation uses a `buckets` pointer for the current hash table and an `oldbuckets` pointer during expansion. During an expansion (or 'grow') operation, a new, larger `buckets` array is allocated, and the `oldbuckets` pointer is made to point to the old `buckets` array to facilitate gradual data migration.

Potential scenarios:

1.  If two goroutines performing a write simultaneously trigger an expansion, both might allocate a new `buckets` array. However, only one of these new arrays will be assigned to the `hmap`'s `buckets` field, leading to the loss of the write from the other goroutine.

Here is an official FAQ: <https://go.dev/doc/faq#atomic_maps>

```
After much discussion, it was decided that in most cases, maps do not need to be accessed safely across multiple goroutines, and only when absolutely necessary, the map might be part of a larger data structure or computation that is already synchronized. Therefore, if every map operation required acquiring a mutex, it would degrade the performance of most programs and only increase safety in a few cases. However, this decision was not easy to make, as it means that uncontrolled map access can lead to program crashes.

The language itself does not preclude atomic map updates. Where needed, for example, when hosting untrusted programs, implementations may interlock map access.

Map access is only unsafe when performing updates. As long as all goroutines are only reading—for example, looking up elements in a map, including iterating over a map with a for range loop—and are not modifying elements by assignment or performing deletion operations, then they can safely access the map concurrently without synchronization.

As an aid to correct map usage, some language implementations include a special check that automatically reports at runtime when a map is unsafely modified by concurrent execution. Additionally, the sync library has a type called sync.Map, which is suitable for certain usage patterns, such as static caches, although it is not suitable as a general replacement for the built-in map type.
```

In summary, map access is only unsafe during concurrent writes. Go's race detector can help identify unsafe concurrent map modifications at runtime. For situations requiring concurrent read and write access, the `sync.Map` type should be used.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/is_go_map_concurrently_safe/  

