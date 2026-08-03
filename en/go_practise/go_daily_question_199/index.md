# Go Daily Question 199



How much space does an empty struct{} occupy? What are its uses?

{{< details summary="🔑 Answer Analysis:" >}}

Answer: 0, used as a placeholder.

For example:

1. map[string]struct{}, can be used to save memory if you only care about the existence of the key.
2. ch := make(chan struct{}, 1), when using channels for concurrency control, we only need a signal but not to pass a value; in this case, struct{} can be used instead.
3. type Lamp struct{} , declares a struct that only contains methods.

```go
type Lamp struct{}

func (l Lamp) On() {
        println("On")

}
func (l Lamp) Off() {
        println("Off")
}
```

Analysis:
Go has globally unique type metadata for each type, which records the size of that type. Since an empty struct has no types within it, its size is 0. However, because type metadata is created, it can be used as a placeholder like a normal type.
It is recommended to refer to `【幼麟实验室】- Go类型系统讲解` for more details.

References:

- 🔗📺️:[【幼麟实验室】- Go类型系统讲解](https://www.bilibili.com/video/BV1hv411x7we?p=12&vd_source=2efe9e7b9d8ada5878fa15a7ad28b0dd)

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_199/  

