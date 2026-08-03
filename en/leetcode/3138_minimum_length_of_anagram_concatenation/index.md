# 3138_Minimum Length of Anagram Concatenation



```go
func minAnagramLength(s string) int {
    
}
```

---

{{< details summary="🧠 Ideas: 👈 Click to expand" >}}

# Enumeration

Let n be the length of string s. Reading the problem, we can see that the given s must be composed of string t (there is a definite conclusion).

Therefore, our answer can be any value from 1 to n.

Suppose the length of string t is k, where k can be 1, 2, 3, 4, 5, n/2, or n.

So we only need to enumerate the length k of string t and check whether it satisfies the condition.

The problem asks us to return the minimum possible length of string t. Therefore, we iterate from small to large and exit as soon as a valid length is found.

{{< /details >}}

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
func minAnagramLength(s string) int {
    n := len(s)
    k := 1
    record := make(map[byte]int)

    for ; k <= n/2; k++ {
        record[s[k-1]]++

        //
        // At this point, we need to check whether the remaining string is
        // entirely partitionable into segments of length k.
        // When K = 1, the remaining string has length n - 1, starting from index k.

        { // If it cannot be divided evenly, there is no chance at all.
            if n%k != 0 {
                continue
            }

        }
        sig := 1
        for i := k; i < n; i += k {
            // Partition the remaining string into segments of length k.
            back := copymap(record)
            // i is the k-th index plus one
            // Partition by length k.
            for j := 0; j < k; j++ {
                back[s[i+j]]--
            }
            if checkmap(back) { // Some element does not match.
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

## Optimization

All characters are lowercase letters, so instead of using a map, we can directly use an array of length 26 to store the counts.

```go
func minAnagramLength(s string) int {
    n := len(s)
    record := [26]int{}
    for k := 1; k <= n/2; k++ {
        record[s[k-1]-'a']++
        // At this point, we need to check whether the remaining string is
        // entirely partitionable into segments of length k.
        // When K = 1, the remaining string has length n - 1, starting from index k.
        { // If it cannot be divided evenly, there is no chance at all.
            if n%k != 0 {
                continue
            }
        }
        sig := 1
        for i := k; i < n; i += k {
            // Partition the remaining string into segments of length k.
            back := record
            // i is the k-th index plus one
            // Partition by length k.
            for j := 0; j < k; j++ {
                back[s[i+j]-'a']--
            }
            if check(back) { // Some element does not match.
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

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3138_minimum_length_of_anagram_concatenation/  

