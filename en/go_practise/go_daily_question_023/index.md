# Go Daily Question 023


How many ways are there to access the member variable `name` through pointer variable `p`? (Multiple choice)

```
A.p.name
B.(&p).name
C.(*p).name
D.p->name
```

{{< details summary="🔑 Answer Analysis:" >}}
Answer:
AC
`&` is the address-of operator, `*` is pointer dereferencing.
`p` is a pointer variable, so `*` can be used for pointer dereferencing.
Go has syntactic sugar, so you can directly use `pointer_variable.member_variable` to access it.
{{< /details >}}


---

> Author: loommii  
> URL: https://loommii.github.io/en/go_practise/go_daily_question_023/  

