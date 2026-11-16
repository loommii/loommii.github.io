# Go Daily Question 045


Will the following code compile?

```go
package main

import (
    "fmt"
)

type worker interface {
    work()
}

type person struct {
    name string
    worker
}

func main() {
    var w worker = person{}
    fmt.Println(w)
}
```

A: Yes; B: No; C: Don't know

{{< details summary="🔑 Answer Analysis:" >}}

A

Interfaces can be embedded in Go structs.

Embedded interfaces have practical uses.
Example: In the standard library `sort` package, there is an interface: `Interface`

```go
type Interface interface {
    // Len is the number of elements in the collection.
    Len() int
    // Less reports whether the element with
    // index i should sort before the element with index j.
    Less(i, j int) bool
    // Swap swaps the elements with indexes i and j.
    Swap(i, j int)
}
type reverse struct {
    // This embedded Interface permits Reverse to use the methods of
    // another Interface implementation.
    Interface
}
```

It embeds an `Interface` to reverse sorting.

The key to embedded interfaces is how to assign a value to this embedded interface. The `sort` package has a function: `Reverse`

```go
func Reverse(data Interface) Interface {
    return &reverse{data}
}
```

When `reverse` is instantiated, the passed `Interface` instance is directly assigned to the embedded interface of `reverse`, and then the `reverse` type can optionally re-implement the methods of the embedded `Interface`. For example, the `Less` method:

```go
func (r reverse) Less(i, j int) bool {
    return r.Interface.Less(j, i)
}
```

Returning to the problem above, if we call the `work` method using an instantiated `w`, it will panic:

```go
var w worker = person{}
w.work()    // panic
```

Similar to `reverse` above, you need to instantiate the `worker` in `person`, which means you need an instance of a type that implements the `worker` interface. For example:

```go
type student struct{
    name string
}

func (s student) work() {
    fmt.Println("I am ", s.name, ", I am learning")
}
```

Then instantiate `person` like this:

```go
var w worker = person{worker: student{"polarisxu"}}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_045/  

