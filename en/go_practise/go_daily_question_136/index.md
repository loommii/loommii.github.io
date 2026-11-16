# Go Daily Question 136


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

- A: Yes;
- B: No;
- C: Don't know

{{< details summary="🔑 Answer Analysis:" >}}

Answer: A [Run online](https://go.dev/play/p/RSSWTD3otlJ)

## 01

We all know Go doesn't have inheritance, but it can simulate some inheritance features through embedded types. It's important to remember that interfaces are also types, and naturally, they can be used as embedded types. If the `person` struct in the problem were changed to:

```go
type person struct {
    name string
    worker worker
}
```

I believe more people would answer correctly. The only difference with embedded types is whether the field name is explicitly specified; otherwise, there is no difference.

Embedding an interface might seem a bit strange: doesn't this type implement the interface by default?! Indeed it does, which is why the following line in the problem compiles:

```go
var w worker = person{}
```

However, because no value is assigned to `worker` when `person` is instantiated, the `worker` in `person` is `nil`. Calling its methods would result in a panic, but compilation is fine.

## 02

Some might ask if embedded interfaces have practical uses. I'll provide an example from the standard library.

In the `sort` package, there is an interface: `Interface`

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
```

This is used for sorting. There is another struct: `reverse`

```go
type reverse struct {
    // This embedded Interface permits Reverse to use the methods of
    // another Interface implementation.
    Interface
}
```

It embeds an `Interface` for reversing the sort order.

The key to embedded interfaces lies in how to assign a value to them. The `sort` package has a function: `Reverse`

```go
func Reverse(data Interface) Interface {
    return &reverse{data}
}
```

Here, when `reverse` is instantiated, the passed `Interface` instance is directly assigned to the embedded interface of `reverse`. Then, the `reverse` type can optionally re-implement the methods of the embedded `Interface`. For example, the `Less` method:

```go
func (r reverse) Less(i, j int) bool {
    return r.Interface.Less(j, i)
}
```

## 03

Returning to the problem above, if we call the `work` method using an instantiated `w`, it will panic:

```go
var w worker = person{}
w.work()    
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

Answer analysis from: <https://polarisxu.studygolang.com/posts/go/action/weekly-question-analysis-embed-interface/>

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_136/  

