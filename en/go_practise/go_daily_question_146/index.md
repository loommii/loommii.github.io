# Go Daily Question 146


What is the output of the following code?

```go
package main

import (
    "encoding/json"
    "fmt"
    "time"
)

func main() {
    t := struct {
        time.Time
        N int
    }{
        time.Date(2020, 12, 20, 0, 0, 0, 0, time.UTC),
        5,
    }

    m, _ := json.Marshal(t)
    fmt.Printf("%s", m)
}
```

- A: {"Time": "2020-12-20T00:00:00Z", "N": 5 };
- B: "2020-12-20T00:00:00Z";
- C: {"N": 5};
- D: `<nil>`

{{< details summary="🔑 Answer Analysis:" >}}

B
[Run online](https://go.dev/play/p/ylPvSph0WKu)

### Go Struct Embedding and Method Inheritance

In Go, structs can embed anonymous structs, thereby achieving effects similar to inheritance. For example, the following struct embeds the anonymous struct `time.Time`:

```go
struct {
    time.Time
    N int
}
```

This method of embedding anonymous structs allows the outer struct to inherit the method set of `time.Time`. Specifically, since `time.Time` implements the `json.Marshaler` interface:

```go
// MarshalJSON implements the json.Marshaler interface.
// The time is a quoted string in RFC 3339 format, with sub-second precision added if present.
func (t Time) MarshalJSON() ([]byte, error) {
    if y := t.Year(); y < 0 || y >= 10000 {
        // RFC 3339 is clear that years are 4 digits exactly.
        // See golang.org/issue/4556#c15 for more discussion.
        return nil, errors.New("Time.MarshalJSON: year outside of range [0,9999]")
    }

    b := make([]byte, 0, len(RFC3339Nano)+2)
    b = append(b, '"')
    b = t.AppendFormat(b, RFC3339Nano)
    b = append(b, '"')
    return b, nil
}
```

Therefore, this struct inherits the `MarshalJSON()` method of the `Time` type. When `json.Marshal` is performed on this struct, the effect is consistent with performing the same operation on `time.Time`, and the output structure is "2020-12-20T00:00:00Z".

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_146/  

