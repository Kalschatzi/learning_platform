+++
title = "HashMap Deep Dive"
type = ""
weight = 9
+++
 
 A HashMap is an implementation of the Map interface in Java that stores key-value pairs. It provides efficient O(1) average-time complexity for operations like insert, delete, and search. However, its performance can degrade under certain circumstances, leading to the worst-case time complexity of O(n).


 ## How HashMap works

 ### Hash Function
  A HashMap uses a hash function to compute an index (called a bucket) where the key-value pair will be stored. The hash function takes the key, processes it, and returns an integer index.
  The goal of a good hash function is to evenly distribute the keys across the available buckets to minimize collisions.

### Buckets

Internally, a HashMap uses an array of buckets (or slots). Each bucket can store multiple key-value pairs in case of collisions (i.e., two keys having the same hash code). When inserting or searching for a key, the hash function maps the key to a specific bucket.

### Collisions

Collisions occur when two or more keys have the same hash code and thus map to the same bucket. There are two main ways to handle collisions:
* Chaining: Each bucket holds a linked list (or other data structure) of entries that have the same hash code. When a collision occurs, the new entry is added to the list in the bucket
* Open Addressing: When a collision occurs, the algorithm searches for the next available slot in the array to place the key-value pair.

### Resizing
As elements are added, the HashMap’s internal array may need to grow. Typically, when the **load factor (the number of elements divided by the number of buckets)** exceeds a threshold (commonly 0.75), the HashMap resizes its array, usually doubling its size and rehashing the elements to new buckets.

## Average Case vs Worst Case
In the average case, if the hash function distributes keys evenly across the buckets, each bucket will hold only a few entries. Therefore, search, insert, and delete operations will take O(1) time, making HashMap very efficient.
The worst-case time complexity for a search in a HashMap is O(n), which occurs when many keys hash to the same bucket (i.e., collisions). In this case, all the key-value pairs in that bucket will be stored in a linked list (or other data structure). If all keys hash to the same bucket, the entire HashMap becomes a linked list, and the search operation would need to traverse all elements in the list, resulting in O(n) time complexity.

{{< figure src="/images/module1/hashmap.png" >}}

This is a classic image of a HashMap and you'll see this in some technical interviews, where you'll be shown a similar image and asked to explain what it means.
