# 3138_同位字符串连接的最小长度



```go
func minAnagramLength(s string) int {
    
}
```

---

{{< details summary="🧠思路:  👈点击" >}}

# 枚举

设 s字符串的长度为n,阅读题目可得提供的s一定是由 字符串 t构成的。(有确定的结)

因此我们输出的结果可能是 n ~ 1,中的其中一个

假设字符串的t的长度为k,k的长度为 1,2,3,4,5,n/2,n

因此我们只要枚举字符串的t的长度为k，然后判断是否符合条件。

题目要求请你返回字符串 t 的 最小 可能长度。因此从小到大遍历,符合条件就退出

{{< /details >}}

{{< details summary="🔑 答案解析： 👈点击" >}}

```go
func minAnagramLength(s string) int {
    n := len(s)
    k := 1
    record := make(map[byte]int)

    for ; k <= n/2; k++ {
        record[s[k-1]]++

        //
        // 到这里就要检测剩下的字符串 是否都是按照 长度 k 来划分了
        // K = 1 时 剩下的字符串 为 n - 1 从下标k出发

        { // 不能整除 一点机会都没有
            if n%k != 0 {
                continue
            }

        }
        sig := 1
        for i := k; i < n; i += k {
            // 这里面就是按照k去划分
            back := copymap(record)
            // i 为k下标 加一
            // 按照长度为k去划分
            for j := 0; j < k; j++ {
                back[s[i+j]]--
            }
            if checkmap(back) { // 存在不符合的
                sig++
            }
        }
        if k*sig == n {
            return k
        }

    }
    if k > n/2 {
        return n
    }
    return k
}
func copymap(in map[byte]int) map[byte]int {
    out := make(map[byte]int)
    for k, v := range in {
        out[k] = v
    }
    return out
}
func checkmap(in map[byte]int) bool {
    ans := true
    for _, v := range in {
        if v != 0 {
            return false
        }
    }
    return ans
}
```

## 优化

都是小写字母储存 因此不用map 直接用长度为26的字母去存储

```go
func minAnagramLength(s string) int {
    n := len(s)
    record := [26]int{}
    for k := 1; k <= n/2; k++ {
        record[s[k-1]-'a']++
        // 到这里就要检测剩下的字符串 是否都是按照 长度 k 来划分了
        // K = 1 时 剩下的字符串 为 n - 1 从下标k出发
        { // 不能整除 一点机会都没有
            if n%k != 0 {
                continue
            }
        }
        sig := 1
        for i := k; i < n; i += k {
            // 这里面就是按照k去划分
            back := record
            // i 为k下标 加一
            // 按照长度为k去划分
            for j := 0; j < k; j++ {
                back[s[i+j]-'a']--
            }
            if check(back) { // 存在不符合的
                sig++
            }
        }
        if k*sig == n {
            return k
        }

    }
    return n
}
func check(in [26]int) bool {
    ans := true
    for _, v := range in {
        if v != 0 {
            return false
        }
    }
    return ans
}
```

{{< /details >}}


---

> 作者: loommii  
> URL: https://loommii.github.io/zh-cn/leetcode/3138_minimum_length_of_anagram_concatenation/  

