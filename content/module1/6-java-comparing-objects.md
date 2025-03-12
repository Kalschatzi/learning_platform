+++
title = "Comparing objects"
type = ""
weight = 6
+++

In Java, you can compare objects using different approaches.
One thing you should *never* do is use `==`.

Let's review an example:
We have the class
```java
public class Animal {
    private String name;

    public Animal(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
```
And then we do
```java
public void testAnimalEquals() {
    Animal schatzi = new Animal("Schatzi");
    Animal schatzi2 = new Animal("Schatzi");
    assertTrue(schatzi == schatzi2);
}
```
Both animals have the same exact name and nothing else.
Using `schatzi == schatzi2`, what's the result?

This will return `false`. This is not how you compare objects in java. Because these are memory pointers, using `==` compares the memory pointer, not the actual value. 
*This is also valid for native Java objects like String*

If you do
```java
public void testAnimalEquals() {
    Animal schatzi = new Animal("Schatzi");
    Animal schatzi2 = schatzi;
    assertTrue(schatzi == schatzi2);
}
```
This will return `true`, as both variables point to the same memory address.

So, how to compare object values correctly?

1. Using `equals()` Method

By default, `equals()` (from Object class) checks for reference equality. To compare object content, we need to override it.

```java
class Animal {
    private String name;
    private int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj instanceof Animal) {
            Animal animal = (Animal) obj;
            return name.equals(animal.name);
        }
        return false
    }
}
```

So now, if you do
```java
public void testAnimalEquals() {
    Animal schatzi = new Animal("Schatzi");
    Animal schatzi2 = new Animal("Schatzi");
    assertTrue(schatzi.equals(schatzi2));
}
```

This will succeed!


1. Using `hashCode()` (Recommended with `equals()`)

If you override `equals()`, you should also override `hashCode()` for correct behavior in collections like `HashMap`.

```java
@Override
public int hashCode() {
    return Objects.hash(name, age);
}
```

1. Using `compareTo()` (for Sorting)

Implement Comparable<T> to compare objects.

```java
class Animal implements Comparable<Animal> {
    private String name;
    private int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public int compareTo(Animal other) {
        return Integer.compare(this.age, other.age);
    }
}
```
The `compareTo` method is called to understand how to sort objects with the different algorithms.
This returns -1 if the object is smaller, 0 if they are equal or 1 if it's larger than the object it's being compared to.  
Usage:
```java
Animal kali = new Animal("Kali", 8);
Animal schatzi = new Animal("Schatzi", 9);
assertEquals(-1, a1.compareTo(a2)); // -1 (kali is younger than schatzi)
```