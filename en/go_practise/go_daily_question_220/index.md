# Go Daily Question 220


How should parts A and B in the code below be modified so that it compiles successfully?

```go
func main() {
	var m map[string]int        //A
	m["a"] = 1 
	if v := m["b"]; v != nil {  //B
		fmt.Println(v)
	}
}
```

```go
func main() {
	m := make(map[string]int)
	m["a"] = 1
	if v,ok := m["b"]; ok {
		fmt.Println(v)
	}
}
```

{{< details summary="🔑 Solution Analysis:" >}}

At A, only the map m is declared without allocating memory space, so it cannot be assigned directly. You need to use make(). It is recommended to initialize a map directly using make() or a composite literal.

At B, for v, k := m["b"], when the element with key b does not exist, v returns the zero value of the value type, and k returns false.

{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_220/  

