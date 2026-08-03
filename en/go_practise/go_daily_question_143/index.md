# Go Daily Question 143


What is the output of the following code?

```go
package main

import "fmt"

func main() {
    i := -5
    j := +5
    fmt.Printf("%+d %+d", i, j)
}
```

- A. -5 +5
- B. +5 +5
- C. -5 5
- D. +5 -5

{{< details summary="🔑 Answer Analysis:" >}}

A
[Run online](https://go.dev/play/p/vDR1EXgEiDa)

According to the official documentation: <https://pkg.go.dev/fmt>

```text
%b Binary
%c Character represented by the corresponding Unicode code point
%d Decimal
%o Octal
%O Octal with 0o prefix
%q Single-quoted character literal safely escaped using Go syntax
%x Hexadecimal, a-f in lowercase
%X Hexadecimal, A-F in uppercase
%U Unicode format: U+1234; equivalent to "U+%04X"
```

```text
+: Always print the sign for numbers; for %q (%+q), guarantees to output only ASCII characters.
-: Pad with spaces on the right rather than left (left-justify field).
#: Alternate format: binary (%#b) adds leading 0b, octal (%#o) adds leading 0, hexadecimal (%#x or %#X) adds leading 0x or 0X; for %p (%#p), does not show leading 0x; for %q, if [strconv.CanBackquote] returns true, prints the raw (backquote-enclosed) string; for %e, %E, %f, %F, %g, and %G, always print a decimal point; for %g and %G, do not remove trailing zeros; for %U (%#U), if the character is printable, for example, written as U+0078 'x'.
(space): For numbers, leave a space for an omitted sign (% d); when printing strings or slices in hexadecimal, add spaces between bytes (% x, % X).
0: Pad with leading zeros rather than spaces; for numbers, this moves the padding after the sign.
```

Returning to this problem, `%+d`. `d` for decimal and `+`: always print the sign for numbers.
Combined, it means printing a decimal number with its sign, so the output is:
A. -5 +5

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_143/  

