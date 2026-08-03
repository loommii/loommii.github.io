# Go Daily Question 154


What is the output of the following code?

```go
func main() {
    i := 65
    fmt.Println(string(i))
}

```

- A. A
- B. 65
- C. compilation error

{{< details summary="🔑 Answer Analysis:" >}}

A [Run online](https://go.dev/play/p/lYfJ6qOVMJV)

`string(i)`: In Go, `string(int)` interprets the integer as a Unicode code point and returns the corresponding character.
65 is the ASCII code (and Unicode code point) for the character 'A', so `string(65)` results in the string "A".

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_154/  

