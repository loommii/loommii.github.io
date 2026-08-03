# 3083_Existence of a Substring in a String and Its Reverse



```go
func isSubstringPresent(s string) bool {
    
}
```

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

```go
// isSubstringPresent checks whether the given string s contains a pair of
// characters as a substring that also appears in reverse order.
func isSubstringPresent(s string) bool {
    // Create a 26x26 boolean array vis to record whether each pair of characters has appeared.
    // The meaning of the indices: vis[x][y] indicates whether the substring formed by
    // character x and character y has appeared.
    // Here x and y are the indices of the characters in the alphabet, from 0 to 25,
    // corresponding to 'a' through 'z'.
    vis := [26][26]bool{} 

    // Iterate over string s starting from the second character, because we need
    // to check substrings formed by two adjacent characters.
    for i := 1; i < len(s); i++ {
        // Compute the alphabet index of the first character of the current pair.
        // For example, if the character is 'a', x is 0; if it is 'b', x is 1, and so on.
        x := s[i-1] - 'a' 
        // Compute the alphabet index of the second character of the current pair.
        y := s[i] - 'a' 

        // Mark the current character pair as having appeared.
        vis[x][y] = true 
        // Check whether a character pair in reverse order exists.
        // If vis[y][x] is true, it means the substring formed by character y and
        // character x has also appeared, so a matching substring has been found;
        // return true.
        if vis[y][x] { 
            return true
        }
    }
    // If no matching substring is found after iterating through the whole string, return false.
    return false
}

```

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3083_find_the_string_in_its_reverse/  

