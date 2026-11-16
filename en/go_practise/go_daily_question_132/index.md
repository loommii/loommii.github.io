# Go Daily Question 132


What is the output of the following code?

```go
type person struct {  
    name string
}

func main() {  
    var m map[person]int
    p := person{"mike"}
    fmt.Println(m[p])
}
```

{{< details summary="🔑 Answer Analysis:" >}}

Answer: 0

Uninitialized map: reads zero value, writes panic.

Run online:
>Reading from an uninitialized map: <https://go.dev/play/p/yVjXasOREaH>
>
>Writing to an uninitialized map: <https://go.dev/play/p/2zmJGtrH-8v>
>
>Writing to an initialized map: <https://go.dev/play/p/eUh6csag8rh>

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_132/  

