# 3019_按键变更的次数



```go
func countKeyChanges(s string) (ans int) {
    
}
```

---
{{< details summary="🔑 答案解析： 👈点击" >}}

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

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3019_number_of_changing_keys/  

