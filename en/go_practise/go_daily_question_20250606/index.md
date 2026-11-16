# Go Daily Question 20250606


What is the output of the following code?

```go
func hello(i int) {
       fmt.Println(i)
}
func main() {
       i := 5
       defer hello(i)
       i = i + 10
}
```

{{< details summary="🔑 Answer Analysis:" >}}

5
[Run online](https://go.dev/play/p/hMcMm9tJw2k)
Go parameters are passed by value only.
When `defer hello(i)` is executed, the value of `i` is already determined.

Below is the structure of `_defer`:

```go
type _defer struct {
       heap      bool
       rangefunc bool    // true for rangefunc list
       sp        uintptr // sp at time of defer
       pc        uintptr // pc at time of defer
       fn        func()  // can be nil for open-coded defers
       link      *_defer // next defer on G; can point to either heap or stack!

       // If rangefunc is true, *head is the head of the atomic linked list
       // during a range-over-func execution.
       head *atomic.Pointer[_defer]
}
```

The registration of `defer` essentially calls the built-in function `runtime.deferproc`.

```go
func deferproc(siz int32, fn *funcval)
```

- `siz int32`:
  - Represents the total size of the `defer` function's arguments (in bytes).
  - Used to allocate enough space on the stack to save arguments.
- `fn *funcval`:
  - Represents the function value of the `defer` function (including the function pointer and captured arguments).
  - `funcval` is a runtime internal struct used to represent function metadata.

Therefore, we can conclude that the captured parameters are already determined at the time of registration.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250606/  

