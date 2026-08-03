# 2264_Largest 3-Same-Digit Number in String



```go
func largestGoodInteger(num string) (ans string) {
    
}
```

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func largestGoodInteger(num string) (ans string) {
    n := len(num)
    sig := struct {
        n int // digit
        i int // repetition count
    }{
        n: -1,
    }
    maxn := -1 //
    for i := 0; i < n; i++ {
        if sig.n == int(num[i]-'0') { // duplicate
            sig.i += 1 // increment repetition count
        } else {
            sig.n = int(num[i] - '0')
            sig.i = 1
        }
        if sig.i >= 3 { // repetition count is >= 3
            maxn = max(sig.n, maxn)
        }
    }
    if maxn == -1 {
        return ""
    }
    ans = strings.Repeat(string(maxn+'0'), 3)
    return
}
```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/2264_largest_3_same_digit_number_in_string/  

