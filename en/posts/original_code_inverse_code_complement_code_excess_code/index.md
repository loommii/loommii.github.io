# Original Code, Inverse Code, Complement Code, Offset Code


<!--more-->

## Term Definitions

Original Code: Original code is the simplest integer representation method, where the highest bit is used to represent the sign (0 represents positive numbers, 1 represents negative numbers), and the remaining bits represent the absolute value of the number. For example, the original code for +5 is 00000101, and the original code for -5 is 10000101.
Inverse Code: Inverse code is obtained by inverting the original code, keeping the original code of positive numbers unchanged, and inverting all bits of the original code of negative numbers (including the sign bit). For example, the inverse code for +5 is 00000101 (the same as the original code), and the inverse code for -5 is 11111010.
Complement Code: Complement code is the most commonly used integer representation method in computers. The complement code of a positive number is the same as its original code, while the complement code of a negative number is its inverse code plus 1. The characteristic of complement code is that during addition and subtraction operations, the sign bit does not need to be processed separately. For example, the complement code for +5 is 00000101, and the complement code for -5 is 11111011.
Offset Code: Offset code is a less common integer representation method, rarely used in the computer field. It is similar to complement code, but all values are offset by a fixed value, usually the midpoint, so that the representation of positive numbers is always greater than that of negative numbers. This representation method may be used in some special hardware designs.
![Relationship](./关系.png)

## Examples

1. Original code is a positive number

```text
Integer +1
0000 0001  // Original Code
0000 0001  // Inverse Code  // Positive number's Inverse Code = Original Code
0000 0001  // Complement Code  // Positive number's Complement Code = Inverse Code = Original Code
1000 0001  // Offset Code  // Offset Code = Complement Code's sign bit inverted
```

2. Original code is 0

```text
Integer +0
0000 0000  // Original Code
0000 0000  // Inverse Code  // Positive number's Inverse Code = Original Code
0000 0000  // Complement Code  // Positive number's Complement Code = Inverse Code = Original Code
1000 0000  // Offset Code  // Offset Code = Complement Code's sign bit inverted

Integer -0
1000 0000  // Original Code
1111 1111  // Inverse Code  // Negative number's Inverse Code = Original Code with sign bit unchanged, others inverted
0000 0000  // Complement Code  // Negative number's Complement Code = Inverse Code + 1 // Here, due to overflow, taking the last 8 bits results in 8 zeros
1000 0000  // Offset Code  // Offset Code = Complement Code's sign bit inverted
```

3. Original code is a negative number

```text
Integer -1
1000 0001  // Original Code
1111 1110  // Inverse Code  // Negative number's Inverse Code = Original Code with sign bit unchanged, others inverted
1111 1111  // Complement Code  // Negative number's Complement Code = Inverse Code + 1
0111 1111  // Offset Code  // Offset Code = Complement Code's sign bit inverted
```

## Application Scenarios

Original Code: Aligns with human intuition, the simplest integer representation method.

Inverse Code:

1. Background: CPUs excel at addition operations. To improve calculation speed, subtraction is often converted to addition, e.g., 1 - 1 becomes 1 + (-1). At this point, it was found that the calculation result did not meet expectations.

```text
   0000 0001  // 1
+ 1000 0001  // -1
 ―――――――――――――――
   1000 0010  // -2
```

2. Problem solved: Solves the issue in `original code` operations where involving the sign bit in calculations leads to unexpected results.

```text
   0000 0001  // 1
 + 1111 1110  // -1
 ―――――――――――――――
   1111 1111  // -0
```

```text
   0000 0001  // 1
 + 1111 1101  // -2
 ―――――――――――――――
   1111 1110  // -1
```

3. Remaining issues: Both original code and inverse code have the problem of +0 and -0, leading to unexpected calculation results when calculating -0.

```text
   0000 0001  // 1
 + 1111 1111  // -0
 ―――――――――――――――
   0000 0000  // +0
```

Complement Code:

1. Background: Inverse code solves most calculation problems, but in continuous calculations, -0 inevitably appears, leading to unexpected results.
2. Problem solved: Inconsistencies in the representation of 0 in original and inverse codes, and the resulting calculation errors (+-0).


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/original_code_inverse_code_complement_code_excess_code/  

