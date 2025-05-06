+++
title = "Data Structures"
type = ""
weight = 8
+++
 
## Array
A fixed-size, indexed collection of elements of the same type.
Best for storing a fixed number of elements with fast access by index.
```java
int[] arr = new int[5];  // Array of 5 integers, default value is 0
```

## ArrayList
A dynamically resizing array that allows random access and provides flexible resizing.
Ideal for collections with frequent access and occasional insertions or deletions.
```java
ArrayList<Integer> arrayList = new ArrayList<>();  // Empty ArrayList of integers
```

## LinkedList
A linear collection where each element (node) contains a reference to the next element. In a double-linked list, each element also holds a reference to the previous element.
Best when frequent insertions and deletions at the beginning or end are required.
```java
List<String> linkedList = new LinkedList<>();  // Empty LinkedList of strings
```

## Hashmap
A collection of key-value pairs, where keys are unique, and each key maps to a value. It uses a hash table for fast lookups.
Ideal for fast lookups, updates, and retrieval by unique keys.
```java
Map<String, Integer> map = new HashMap<>();  // Empty HashMap with String keys and Integer values
```

## HashSet
A collection that stores unique elements, backed by a hash table. - essentially a HashMap without a value, just the key.
Ideal for storing unique elements where fast lookup, insertion, and deletion are needed.
```java
HashSet<String> hashSet = new HashSet<>();  // Empty HashSet of strings
```

## TreeMap
A sorted map implementation based on a red-black tree, where keys are ordered.
Best when elements need to be stored in a specific order or need to be traversed in sorted order.
```java
Map<String, Integer> treeMap = new TreeMap<>();  // Empty TreeMap with String keys and Integer values (sorted by keys)
```

## TreeSet
A collection that implements the Set interface, backed by a TreeMap (often a red-black tree). It stores unique elements in a sorted order.
Best when you need to store unique elements that should be kept sorted and require fast access, insertion, and removal with ordering. It's ideal when you need a sorted set.
```java
Set<Integer> treeSet = new TreeSet<>();  // Empty TreeSet of integers (sorted by natural order)
```

## Comparing different data structures and their operations


| Data Structure      | Access | Search | Insertion | Deletion |
|---------------------|--------|--------|-----------|----------|
| **Array**          | O(1)   | O(n)   | O(n)      | O(n)     |
| **ArrayList**      | O(1)   | O(n)   | O(n)      | O(n)     |
| **LinkedList**     | O(n)   | O(n)   | O(1)      | O(1)     |
| **HashMap**        | O(1)   | O(1)   | O(1)      | O(1)     |
| **TreeMap**        | O(log n) | O(log n) | O(log n) | O(log n) |
| **HashSet**        | O(1)   | O(1)   | O(1)      | O(1)     |
| **TreeSet**        | O(log n) | O(log n) | O(log n) | O(log n) |

