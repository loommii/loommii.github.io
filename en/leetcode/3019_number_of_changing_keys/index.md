# 3019_Number of Changing Keys



```go
func countKeyChanges(s string) (ans int) {
    
}
```

---
{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func countKeyChanges(s string) (ans int) {
    n := len(s)
    for i := 1; i < n; i++ {
        if s[i-1]&31 != s[i]&31 {
            ans++
        }
    }
    return
}

```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3019_number_of_changing_keys/  

