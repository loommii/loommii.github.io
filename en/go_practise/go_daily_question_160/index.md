# Go Daily Question 160


Will they compile? Why?

```go
// 32-bit machine
1）var x int32 = 32.
2）var y int = x
3）var z rune = x
```

{{< details summary="🔑 Answer Analysis:" >}}

1 [Can compile](https://go.dev/play/p/9eGpGYkcqqp)
2 [Cannot compile](https://go.dev/play/p/L5LsYs4NvDO)
3 [Can compile](https://go.dev/play/p/xgIjiu6PQ1l)

## Analysis

# Go Language Type System and Code Analysis

## 1. Untyped Literals

In Go, literals (such as `32.0`) are untyped. Untyped literals can be implicitly inferred to the target type based on context.

### Example

```go
var a int64 = 32.0    // 32.0 is an untyped floating-point literal, assigned to int64 type
var b int = 32.0      // 32.0 is an untyped floating-point literal, assigned to int type
var c float32 = 32.0  // 32.0 is an untyped floating-point literal, assigned to float32 type
var d complex64 = 32.0 // 32.0 is an untyped floating-point literal, assigned to complex64 type
var e byte = 32.0     // 32.0 is an untyped floating-point literal, assigned to byte type
var f rune = 32.0     // 32.0 is an untyped floating-point literal, assigned to rune type
```

## 2. Go Language Type System

Go's type system is very strict and does not have implicit type conversions. Even if the underlying representation of two types is the same, they are still different types and cannot be directly assigned.

```go
var x int32 = 32
var y int = x // Compilation error: cannot use x (type int32) as type int in assignment
```

Correction method:
Explicit type conversion must be performed:

```go
var y int = int(x) // Explicit type conversion
```

## 3. Type Aliases

Go 1.9 introduced the concept of type aliases. Type aliases and their original types are completely identical.

```go
type intalias = int // intalias is an alias for int
```

`rune` and `byte` in Go are built-in type aliases:

```go
type rune = int32
type byte = uint8
```

In this problem:

```go
var x int32 = 32.0 // Can compile, because untyped literal 32.0 can be assigned to int32 type.
var y int = x // Compilation fails, because int and int32 are different types, and Go does not implicitly convert.
var z rune = x // Can compile, because rune is a type alias for int32, and x's type is int32, so it can be directly assigned to z.
```

## 4. Problem Code Analysis

```go
1) var x int32 = 32.0 // Compiles successfully because the untyped literal 32.0 can be assigned to int32 type.
2) var y int = x // Compilation fails because int and int32 are different types, and Go does not implicitly convert.
3) var z rune = x // Compiles successfully because rune is a type alias for int32, and x's type is int32, so it can be directly assigned to z.
```

## 5. Corrected Code

```go
var x int32 = 32.0       // Correct, untyped literal assigned to int32
var y int = int(x)       // Correct, explicit type conversion
var z rune = x           // Correct, rune is an alias for int32
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_160/  

