# Go Daily Question 025


Regarding string concatenation, which of the following syntax is correct?

```
A. str := 'abc' + '123'
B. str := "abc" + "123"
C. str := '123' + "abc"
D. fmt.Sprintf("abc%d", 123)
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: BD
`' '` can only be used for single characters, so A and C will not compile.

For string concatenation, `buffer.WriteString()` is recommended.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_025/  

