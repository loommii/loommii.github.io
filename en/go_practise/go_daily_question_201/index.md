# Go Daily Question 201


Differences between new() and make()

{{< details summary="🔑 Answer Analysis:" >}}

new(T) allocates zeroed memory for a new value of type T and returns its address (a pointer), i.e., a value of type *T. In other words, it returns a pointer to a newly allocated, zero-valued T. It is suitable for value types, such as arrays and structs.

make(T, args) returns an initialized value of type T, which is not the zero value of type T, nor is it a pointer *T; it is a reference to an initialized T. make() is only applicable to slices, maps, and channels.

References:

- 🔗📺️:[【Golang】What does slice type store? make and new? slice and array? Expansion rules](https://www.bilibili.com/video/BV1CV411d7W8/?spm_id_from=333.999.0.0&vd_source=2efe9e7b9d8ada5878fa15a7ad28b0dd)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_201/  

