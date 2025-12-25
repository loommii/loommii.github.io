---
date: '2024-12-16T19:47:30+08:00'
draft: false
title: 'Go: 为什么Map是无序的'
---
### 底层结构

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
// buckets的结构
type bmap struct {
    topbits  [8]uint8
    keys     [8]keytype
    values   [8]valuetype
    pad      uintptr
    overflow uintptr
}
```

### 解释

Map中的数据存储在buckets和oldbuckets中,在发生扩容时,会创建新的buckets,并将老的buckets地址写入到oldbuckets中。

因此发生扩容后,存储数据会发生改变

#### 疑问：那不发生扩容的情况下，我们遍历map为什么输出的顺序都不一致呢？

这是特意去设计的，Go在range遍历Map中元素的时候，从随机的一个位置开始迭代。

在Go1.0后的版本，Go遍历加入了随机数,输出的顺序将无序
源码链接：<https://github.com/golang/go/blob/18b5435fc84225ca303da7a110c7e8065dc4bbda/src/runtime/map_noswiss.go#L912>

```go
func mapiterinit(t *maptype, h *hmap, it *hiter) {
    // ...
    // decide where to start
    r := uintptr(rand())
    // ...
}
```
