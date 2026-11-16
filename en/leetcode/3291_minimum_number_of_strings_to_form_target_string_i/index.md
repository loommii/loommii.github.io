# 3291_Minimum Number of Strings to Form Target String I


{{< details summary="🧠 Approach: 👈 Click to expand" >}}

Minimum? A DP problem?

Try to break it into subproblems

XXXXABC  XXXXAED

EDFXXXX
Suppose we have already matched this far

If the next character of the current string matches T -> enter the next loop

If it does not match (F) -> check whether the first character of the chosen string matches T -> enter the next loop

If it does not match (F) -> this path is a dead end

We can branch into two paths: matching the next character of the current string and matching the first character of a chosen string simultaneously

First try writing a recursive solution - depth-first traversal?

{{< /details >}}

---

{{< details summary="🔑 Solution Analysis: 👈 Click to expand" >}}

### Recursion (timeout)

```go
func minValidStrings(words []string, target string) int {
    nT := len(target)
    var dfs func(int, int, int, int) int // Returns -1 if impossible, otherwise the number of strings used
    dfs = func(ni, nii, nTi, ansi int) int {
        if nTi == nT { // Already at the end
            return ansi
        }
        ans1 := -1
        if len(words[ni]) > nii && words[ni][nii] == target[nTi] { // Whether the next character of the current string matches
            ans := dfs(ni, nii+1, nTi+1, ansi)
            if ans != -1 && ans1 == -1 {
                ans1 = ans
            } else if ans != -1 {
                ans1 = min(ans1, ans)
            }
        }

        for i, v := range words {
            if v[0] == target[nTi] {
                ans := dfs(i, 1, nTi+1, ansi+1)
                if ans != -1 && ans1 == -1 {
                    ans1 = ans
                } else if ans != -1 {
                    ans1 = min(ans1, ans)
                }
            }
        }
        return ans1
    }
    ans1 := -1
    for i, v := range words {
        if v[0] == target[0] {
            ans := dfs(i, 1, 1, 1)
            if ans != -1 && ans1 == -1 {
                ans1 = ans
            } else if ans != -1 {
                ans1 = min(ans1, ans)
            }
        }
    }
    return ans1
}
```

### String Hash + Binary Search

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/3291_minimum_number_of_strings_to_form_target_string_i/  

