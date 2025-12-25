---
date: '2024-12-16T20:06:16+08:00'
draft: false
title: 'Go: Map 是并发安全的吗？'
---
## 结论

并发读安全，并发写不安全

## 原因

```go
// map(集合)底层结构
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
// buckets的结构
type bmap struct {
    topbits  [8]uint8
    keys     [8]keytype
    values   [8]valuetype
    pad      uintptr
    overflow uintptr
}
```

从上方结构可以知道底层结构中存buckets和oldbuckets。发生扩容的时候。会New一个新的buckets地址,并将老的buckets地址写入到oldbuckets中。

可能发生的场景

1. 如果当2个写请求同时触发了扩容,这时候就new了2个新的buckets地址，buckets地址只有一个赋值成功,导致写入内容丢失。

这里有一片篇官方的QA <https://go.dev/doc/faq#atomic_maps>

```
经过长时间的讨论，决定认为大多数情况下使用 map 不需要在多个 goroutine 中进行安全访问，只有在确实需要时，map 可能是某个更大的数据结构或计算的一部分，且该数据结构已经进行了同步。因此，如果每次 map 操作都需要获取互斥锁，会降低大多数程序的性能，并且只会在极少数情况下增加安全性。然而，这个决定并不容易做出，因为它意味着不受控制的 map 访问可能会导致程序崩溃。

语言本身并不排除原子性的 map 更新。在需要的情况下，例如在托管不受信任的程序时，实施可能会对 map 访问进行互锁。

只有在进行更新时，map 访问才是不安全的。只要所有 goroutine 仅仅是读取——例如查找 map 中的元素，包括通过 for range 循环迭代 map——并且没有通过赋值修改元素或进行删除操作，那么它们可以在不进行同步的情况下安全地并发访问 map。

作为对正确使用 map 的帮助，某些语言实现包含一个特殊检查，会在运行时自动报告当 map 被并发执行不安全地修改时的情况。此外，sync 库中有一个类型叫 sync.Map，它适用于某些使用模式，例如静态缓存，虽然它不适合作为内建 map 类型的一般替代品。
```

概况: 只有在进行更新时，map 访问才是不安全的,程序运行时会自动检测发执行不安全地修改时的情况。需要并发修改请用sync.Map
