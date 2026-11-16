# Go Daily Question 003

Why are map keys unordered?

When iterating over a map, we find that the output keys are unordered. Why is that?

{{< details summary="🔑 Answer Analysis:" >}}

After Go <= 1.0, iterating over a map results in unordered keys.
This is due to the implementation principle of Golang maps. During resizing, a map points to new buckets, but it does not immediately migrate all entries; instead, it points to both new and old buckets. Iterating over a map essentially iterates over these two sets of buckets. However, if resizing occurs, the key positions change, leading to different iteration results.
Before Go > 1.0, iterating over a map was ordered when not resizing, and unordered after resizing. To unify this, Go >= 1.0 introduced random seeding for map iteration, making the iteration unordered.

References:

- 🔗:[Why are map keys unordered?](https://golang.design/go-questions/map/unordered)
- 🔗:[Why iterating over Go map is unordered (source code analysis)](https://cloud.tencent.com/developer/article/1422355)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_003/  

