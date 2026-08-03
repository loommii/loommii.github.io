# Go Daily Question 192


When iterating over a map, we find that the output keys are unordered. Why?

{{< details summary="🔑 Answer Analysis:" >}}

The fundamental reason why the output keys are unordered is that when traversing a map, it doesn't always start traversing from bucket #0. Instead, it starts from a randomly numbered bucket, and from a randomly numbered cell within that bucket.
This random starting point was introduced starting from Go 1.0.
Why introduce random seeding? Because in older versions, if no reallocation occurred, the iteration order was fixed. However, after reallocation, the iteration order would become non-deterministic. This could lead to ambiguity.
During reallocation, keys that were originally in the same bucket might be distributed to different buckets, causing the iteration order to change.

You can read the article [Go_为什么Map是无序的](../../../skill/data/Go_为什么Map是无序的) (Go_Why_Map_is_unordered)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_192/  

