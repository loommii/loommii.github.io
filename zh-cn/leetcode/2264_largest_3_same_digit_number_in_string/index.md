# 2264_字符串中最大的3位相同数字



```go
func largestGoodInteger(num string) (ans string) {
    
}
```

---

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
func largestGoodInteger(num string) (ans string) {
    n := len(num)
    sig := struct {
        n int // 数字
        i int // 重复次数
    }{
        n: -1,
    }
    maxn := -1 //
    for i := 0; i < n; i++ {
        if sig.n == int(num[i]-'0') { // 重复的
            sig.i += 1 //重复次数+1
        } else {
            sig.n = int(num[i] - '0')
            sig.i = 1
        }
        if sig.i >= 3 { // 重复次数 大于等于3了
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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/2264_largest_3_same_digit_number_in_string/  

