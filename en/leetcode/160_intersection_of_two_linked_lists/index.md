# 160. Intersection of Two Linked Lists



```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func getIntersectionNode(headA, headB *ListNode) *ListNode {

}
```

### Solution

#### Hash Set
>
> Brute force: add all nodes of A into a map, then traverse B; if a node already exists in the map, return that node

```go
func getIntersectionNode(headA, headB *ListNode) (ans *ListNode) {
    var headMap = make(map[*ListNode]struct{})
    for headA != nil {
        headMap[headA] = struct{}{}
        headA = headA.Next
    }
    for headB != nil {
        _, ok := headMap[headB]
        if ok {
            return headB
        }
        headB = headB.Next
    }

    return
}
```

Time complexity O(N), space complexity O(N)

#### Two Pointers

![alt text](image-4.png)

```go
func getIntersectionNode(headA, headB *ListNode) (ans *ListNode) {
    if headA == nil || headB == nil {
        return
    }
    p, q := headA, headB
    for p != q {
        if p != nil {
            p = p.Next
        } else { // If it has already reached the final null node
            p = headB // Enter the other linked list y
        }
        if q != nil {
            q = q.Next
        } else { // If it has already reached the final null node
            q = headA // Enter the other linked list x
        }
    }
    return p
}

```

Time complexity O(N), space complexity O(1)


---

> Author: loommii  
> URL: https://loommii.github.io/en/leetcode/160_intersection_of_two_linked_lists/  

