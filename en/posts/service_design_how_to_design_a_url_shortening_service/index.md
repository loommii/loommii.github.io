# Service Design: How to Design a URL Shortening Service


<!--more-->

### What is a URL Shortening Service?

The essence of a URL shortening service is to redirect a short URL to the original long URL through the HTTP 302 redirection mechanism.

### What Problems Does a Short Link Service Solve?

1.  Solving the character limit issue for message sending
    For example, Tencent Cloud SMS limits each message to 500 characters. In marketing SMS, URLs often carry numerous parameters (e.g., invitation platform, inviter, activity ID, etc.). These parameters make the URLs very long. Through a URL shortening service, the long URLs in marketing SMS can be replaced with short links, saving character space.
    ![Tencent Cloud SMS](image.png)
2.  Hiding request parameters
    Taking a marketing campaign as an example, common parameters in URLs might include information like the activity ID. If we don't want these IDs to be modified随意, we can add a corresponding activity ID KEY to the parameters. This way, users can only enter the corresponding activity page when the ID and KEY match. However, after adding the KEY, the original URL becomes even longer. A short link service can help hide these request parameters, keeping the URL concise and secure.

### The Most Basic Requirements

1.  Long URL Registration
2.  Short URL Redirection

### Why Choose Base62 Encoding for Short Link Keys?

According to the RFC3986 standard, URLs consist of ASCII characters. The following characters can be safely used in URLs:

-   Letters (a-z and A-Z)
-   Numbers (0-9)
-   Some special characters: $-_.+!*'(),

Although the RFC3986 standard allows some special characters, certain special characters might cause problems with URL parsing, transmission, or storage. For example, characters like &, ?, =, #, etc., have specific meanings in query parameters or paths, so they might cause conflicts or parsing errors.

> To avoid these potential troubles, especially when needing to encode complex query parameters or keys into a URL-friendly format, we usually choose Base62 encoding, which uses only the combination of letters (upper and lower case) and numbers.
>
### Choosing the Length of the Short Link Key

Our character set is already determined to be Base62, so a length of 1 can store 62 types. For each additional digit, the storage limit increases exponentially by powers of 62.

| Length | Storage Limit | Interpretation |
|:-------|:--------------|:---------------|
| 1      | 62            | 1 digit can represent 62 different combinations |
| 2      | 62 × 62 = 3,844 | 2 digits can represent 62 squared, i.e., 3,844 different combinations |
| 3      | 62 × 62 × 62 = 238,328 | 3 digits can represent 62 cubed, i.e., 238,328 different combinations |
| 4      | 62 × 62 × 62 × 62 = 14,776,336 | 4 digits can represent 62 to the fourth power, i.e., 14,776,336 different combinations |
| 5      | 62 × 62 × 62 × 62 × 62 = 916,132,832 | 5 digits can represent 62 to the fifth power, i.e., 916,132,832 different combinations |
| 6      | 62 × 62 × 62 × 62 × 62 × 62 = 56,800,235,584 | 6 digits can represent 62 to the sixth power, i.e., 56,800,235,584 different combinations |

> The storage limit for 5 digits has already reached 916,132,832. This number is already very large and sufficient to support most application scenarios. However, if you hope to further reduce conflicts when generating characters or plan for the long term, choosing 6 digits as the short link KEY length would be a good choice.

### Generation of Short Link Keys

There is no best solution, only the most suitable one.

#### Solution 1: Randomly Generate Short Link Keys

Implementation: The system generates the corresponding short link key through a random function.
Advantages:

-   Easy to implement: The implementation of randomly generating short link keys is relatively simple. It can quickly obtain short link identifiers by generating random numbers and mapping them to the Base62 character set. Most programming languages provide simple random number generation functions, making it convenient to operate.

Disadvantages:

-   The probability of conflicts increases as the amount of existing data grows.
-   The same long URL will generate different short link keys, which may lead to waste.

Solution: Use hash calculation.

#### Solution 2: Hash Algorithm

Implementation: Generate a fixed-length short link key from the long URL using a hash algorithm.

Advantages:

-   Solves the problem of the same long URL generating different short links: The hash algorithm ensures that the same long URL always generates the same short link key, thus avoiding storage redundancy.

Disadvantages:

-   Possibility of hash collisions: Although hash functions can generate fixed-length short links, different long URLs might produce the same hash value, leading to hash collisions.
    ![Hash Collision](image-1.png)
Solution: When encountering hash collisions, meaningless strings can be inserted after the hash value, or other deduplication strategies can be adopted, such as performing a secondary hash calculation.

#### Solution 3: Counter Increment Method + Dictionary

Implementation: Maintain a counter. Each time a new long URL is added, the counter increments, and then the counter value is converted into a fixed short link key.
> Example: Value 66, short link key is dictionary[0]+dictionary[0]+dictionary[0]+dictionary[0]+dictionary[1]+dictionary[4]

Advantages:

-   No possibility of conflicts in a single-machine environment: Since the counter is incremented, each short link key is unique, so no conflicts will occur.

Disadvantages:

-   The generated short link keys exhibit obvious patterns: Because the short link keys are generated based on the counter, the keys have an obvious incremental pattern, making them easy to guess or predict.
-   In a distributed environment, conflicts are possible: In a distributed environment, if multiple nodes use the same counter, it may lead to short link key conflicts.
-   The same long URL will generate different short link keys, possibly leading to waste: Each time a short link is generated, the same long URL will get a different short link key.

Solution: The generation logic can be optimized through methods like counter inversion, shuffled dictionaries, or hash calculations to reduce patterns and conflicts.

#### Solution 4: Counter Increment Method + Shuffled Dictionary + Counter Inversion + Hash Calculation

Implementation:

-   Shuffled Dictionary: At service startup, shuffle the order of the dictionary to ensure that the same counter value generates different short link keys, thereby avoiding conflicts in a distributed environment.
-   Counter Inversion: To break the regularity in short link generation, perform an inversion operation on the generated number based on the counter increment. This increases the magnitude of each number change, making the generated short link keys more diverse.

> For example, 123 -> 00 0000 0123 -> 32 1000 0000

Advantages:

-   Almost solves all problems: This solution, through multiple optimizations, almost solves all potential problems, such as conflicts, regularity, and waste.

Disadvantages:

-   Service implementation is relatively complex: This solution requires additional logic to handle dictionary shuffling, counter inversion, etc., making the service implementation more complex.
-   Higher performance requirements


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/service_design_how_to_design_a_url_shortening_service/  

