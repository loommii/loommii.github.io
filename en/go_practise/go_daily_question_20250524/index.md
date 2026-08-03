# Go Daily Question 20250524


Is slice thread-safe?

{{< details summary="🔑 Answer Analysis:" >}}

- It is not concurrently safe. Dynamic resizing (expansion) can lead to it pointing to a new array. Concurrent writes can lead to potential data loss.
- The solutions are to use a lock, or to serialize access through channels.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_20250524/  

