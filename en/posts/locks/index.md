# Locks


In concurrent computing, computers are highly likely to encounter data corruption issues. Therefore, "locks" are introduced to solve this type of problem.
Common locks: Mutex, Spinlock, Read-Write Lock, Pessimistic Lock, Optimistic Lock.

<!--more-->

## Mutex

Characteristics: Easy to implement, the most basic lock concept.

Explanation: When using a resource, lock it first before using. After locking, no other threads can lock it again. Until unlocked, other threads can then lock and use it.

Real-life example: Public restroom, whoever wants to use the restroom must lock it first before use, preventing others from entering and using the restroom.

## Spinlock

A spinlock is very similar to a mutex.
Difference:

- Spinlock: If locking fails, the thread will continuously try to acquire the lock until it gets the lock.
- Mutex: If locking fails, the thread will release the CPU resource and wait for unlocking before applying for the lock again.

Real-life example -> Public restroom
Spinlock: Continuously knocking on the door until the person inside comes out.
Mutex: Stays idle until the person inside comes out and calls you.

## Read-Write Lock

As the name suggests, it consists of a `read lock` and a `write lock`. Reading data is often done concurrently, and concurrent writing of data may lead to unexpected results.

- Reading data requires that there is currently no write lock.
- Writing data requires that there is currently no write lock or read lock.
Real-life example: Assume all exam scores for a class are written in the same notebook. Students read the scores, and teachers write the scores. Students can view the scores simultaneously, but Chinese and Math teachers cannot concurrently write scores on the same page.

Read-write locks can be divided into `Read-Priority Lock`, `Write-Priority Lock`, and `Fair Read-Write Lock`.

- Read-Priority Lock
    Students, upon seeing a teacher waiting to modify data, ignore the teacher and continue reading data.
- Write-Priority Lock
  - Reading data also requires that there are no waiting write locks.

    Students, upon seeing a teacher waiting to modify data, will actively let the teacher write the data.
- Fair Read-Write Lock
  - Put read requests into a queue, and read/write in turn.

    Students and teachers form a queue.

## Optimistic Lock and Pessimistic Lock

Mutex, Spinlock, and Read-Write Lock are all pessimistic locks.

Pessimistic Lock: The probability of multiple threads simultaneously modifying shared resources is relatively high, making conflicts likely. Therefore, a lock is required before accessing shared resources.
Optimistic Lock: Assumes the probability of conflicts is relatively low. It does not apply any lock, but instead verifies whether the data has been modified. If it has been modified, the current operation is abandoned.


---

> Author: loommii  
> URL: https://loommii.github.io/en/posts/locks/  

