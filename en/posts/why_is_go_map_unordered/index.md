# Go: Why Are Maps Unordered?


<!--more-->
### Underlying Structure

```go
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
// A bucket for a map.
type bmap struct {
    topbits  [8]uint8
    keys     [8]keytype
    values   [8]valuetype
    pad      uintptr
    overflow uintptr
}
```

### The Two Main Reasons for Unordered Iteration

There are two primary reasons why you cannot rely on any specific order when iterating over a Go map.

#### 1. The Nature of Hash Tables

A Go `map` is implemented as a hash table. When a key-value pair is added, the key is put through a hash function to calculate a hash value. This value determines which bucket the entry is stored in. The storage location is based on the key's hash, not its insertion order.

Furthermore, when a map grows and needs to be resized, its key-value pairs are re-distributed across a new set of buckets. This rehashing process will almost certainly change the internal layout of the data.

#### 2. Intentional Randomization

Even if a map's hashing function and bucket layout were predictable, the Go team took an extra step to ensure developers don't rely on iteration order.

Since Go 1.2, the runtime intentionally randomizes the starting point of map iteration. For every `for...range` loop over a map, the runtime chooses a random starting bucket. This was a deliberate design choice to make it obvious that map iteration order is not guaranteed. If developers were able to rely on a consistent, albeit undefined, order, it could lead to subtle and hard-to-debug issues in their code.

This randomization happens in the `mapiterinit` function in the Go runtime source.

Source code link: <https://github.com/golang/go/blob/18b5435fc84225ca303da7a110c7e8065dc4bbda/src/runtime/map_noswiss.go#L912>

```go
// mapiterinit initializes a map iterator.
func mapiterinit(t *maptype, h *hmap, it *hiter) {
    // ...
    // decide where to start
    r := uintptr(rand())
    // ...
}
```


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/why_is_go_map_unordered/  

