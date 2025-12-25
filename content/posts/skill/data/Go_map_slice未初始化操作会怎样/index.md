---
date: '2024-12-16T19:03:04+08:00'
draft: false
title: 'Go: slice(切片) 和 map(集合) 未初始化操作会怎样'
---
## 底层结构

```go
// slice(切片)
type SliceHeader struct {
    Data uintptr // 底层数组的地址
    Len  int     // 长度
    Cap  int     // 容量
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

这2个类型都属于引用类型,特点是存储的是一个地址,且零值为nil

通过上面代码你会发现底层结构都存在指向其他空间的地址

- slice(切片) Data指向底层数组
- map(集合) buckets存储桶 oldbuckets旧的存储桶 mapextra 保存溢出桶的链表和未使用的溢出桶数组的首地址

因此如果为初始化的情况下。指向的地址为nil。

## slice(切片)

1. 未初始化读取
    - 指定下标

        这时候slice长度和空间都为0,如果通过下标的形式读取会panic。越界了
    - for range

        无内容,不会发生panic <https://go.dev/play/p/PlQgXmM7MKe>
2. 未初始化写入
    - 指定下标

        这时候slice长度和空间都为0,如果通过下标的形式写会panic。越界了
    - append

        不会发生panic,可以正常写入 <https://go.dev/play/p/wo6M-xCZ6XW>

## map(集合)

1. 未初始化读取
    - 指定Key值

        不会发生panic,读取到的为0值 <https://go.dev/play/p/Fjd67YLcHj4>
    - for range

        不会发生panic,无内容 <https://go.dev/play/p/h6U7522hWBv>
2. 未初始化写入

    发生panic,`panic: assignment to entry in nil map` <https://go.dev/play/p/S8xUziyKnLa>
2. 未初始化删除

     不会发生panic,<https://go.dev/play/p/Be3SgjevDlA>

## 为什么未初始化Map写入会panic 而slice(切片不会)

1. slice在添加的时候使用的是append,写入的时候会判断是否超过容量,超过就发生扩容。扩容后的数组地址就不为之前的nil
2. map也有扩容机制为什么还是会panic

```go
func mapassign(t *maptype, h *hmap, key unsafe.Pointer) unsafe.Pointer {
    if h == nil {
        panic(plainError("assignment to entry in nil map"))
    }
    // 省略细节
}
```

make map的时候 会设置hash0哈希因子,若未初始化hash0就为0。操作的时候会除以hash0 。/0 是不被允许的

## 如何避免

1. 引入单元测试,这种未初始化操作导致的panic异常是可预见的,因在项目开发中加入单元测试。
2. recover恢复panic
