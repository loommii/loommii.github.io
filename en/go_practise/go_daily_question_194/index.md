# Go Daily Question 194



Can Go maps be iterated over and deleted from concurrently?

{{< details summary="🔑 Answer Analysis:" >}}

This question needs to be analyzed based on different scenarios.

*   If in different goroutines, a map cannot be iterated over and deleted from concurrently. A map is not a thread-safe data structure. Simultaneously reading and writing to a map is undefined behavior, and if detected, it will directly panic.

*   If in the same goroutine, a map can be iterated over and deleted from concurrently:

    ```go
    for k := range m {
        delete(m, k)
    }
    ```

    However, it is not recommended to clear a map this way. It is recommended to reassign an empty map to the map. The old map will be garbage collected.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_194/  

