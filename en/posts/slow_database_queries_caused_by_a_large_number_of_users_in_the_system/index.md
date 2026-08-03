# Slow Database Queries Caused by a Large Number of Users in the System


<!--more-->

**Problem Analysis:**

1.  **High Growth Due to Excessive Data**
    MySQL's default storage engine, InnoDB, uses a B+ tree data structure. A 3-layer tree can roughly store 20 million rows of data. Exceeding this number causes the 3-layer tree to become a 4-layer tree, adding an extra disk I/O read operation, which slows down SQL queries.
2.  **Insufficient Concurrent Connections**
    MySQL's default maximum number of connections is 151, which can be changed in `/etc/my.conf`. See the documentation for the `max_connections` parameter for details.
    Exceeding the connection limit will result in a `too many connections` error.

**Solutions:**

**Database and Table Sharding:**
Horizontally partition the data based on a certain dimension.

### Range-based

For example:
*   User ID [0, 5 million) goes to Database 1, Table 1.
*   User ID [5 million, 10 million) goes to Database 2, Table 2.

👆 Doing this will lead to an additional problem.
> You will find that old users with small user IDs are often offline, while users with newer IDs are still active, still causing Database 2's connection count to be exceeded.

Therefore, we cannot simply shard databases and tables based on the size of the ID.
At this point, we can introduce hashing (hash).

### Hash

The hash method can distribute user IDs across multiple databases and tables.
```go
if hash(userID)%2 == 0 {
     Put in Database 1, Table 1
} else if hash(userID)%2 == 1 {
     Put in Database 2, Table 2
}
```
👆 Doing this will lead to an additional problem.
> Our modulo operation is based on the total number of databases and tables. We currently have 2. If one day the user data grows so much that we need to add a new table, the formula becomes `hash(userID)%3`, causing it to look up the wrong table. At this point, we need to migrate historical data (full amount) from the table to the table after `hash(userID)%3`. The cost is too high.

At this point, we can introduce consistent hashing.

### Consistent Hashing

We change `%(total number of hosts)` in the hash to `%(2^32)`,
so the user ID will be a point in [0, 2^32].
![alt text](image.png)

At this point, we also throw the nodes (tables) into the hash.
`hash(userID)%(2^32)`
`hash(nodeID)%(2^32)`

Then, starting from the user's hashed value, find the nearest node.
![alt text](image-1.png)

If we encounter the problem of adding nodes in the hash.
![alt text](image-2.png)
For example, adding D in the figure above, we only need to migrate node B to node D.
Compared to ordinary hash algorithms, consistent hashing has a lower cost for data migration caused by node count changes.

👆 This might lead to an additional problem.
> If there are too few nodes, a large amount of data might only access one node.
![alt text](image-3.png)

At this point, we can introduce virtual nodes.

### Consistent Hashing + Virtual Nodes

Add several aliases to the nodes.
For example,
nodes A1, A2, and A3 all actually correspond to node A.

If possible, this can make the distribution of nodes on the hash ring more reasonable.
![alt text](image-4.png)


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/slow_database_queries_caused_by_a_large_number_of_users_in_the_system/  

