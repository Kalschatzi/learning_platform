+++
title = "Inheritance"
type = ""
weight = 3
+++

## Inheritance

Inheritance is an OOP concept that allows one class (child/subclass) to inherit properties and behaviors from another class (parent/superclass). It promotes code reuse and hierarchy-based organization.

```java
class Animal {
    void eat() {
        System.out.println("This animal eats food.");
    }
}

// Child Class
class Dog extends Animal {
    void bark() {
        System.out.println("Dog barks.");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.eat();  // Inherited method
        myDog.bark(); // Own method
    }
}
```

## Interfaces

An interface is like a contract that defines methods without implementations. A class must implement an interface to provide method definitions.

```java
interface Animal {
    void eat();  // Method without a body (abstract method)
}
```

Next, we can create a class that implements this contract.

```java
class Dog implements Animal {
    public void eat() {  // Must override the method
        System.out.println("Dog is eating...");
    }
}
```
### Interfaces with default method
Java 8 introduced default methods in interfaces, allowing methods with implementations, making it work very similarly to abstract classes.

```java
interface Animal {
    void eat();  // Abstract method
    
    default void sleep() {  // Default method with implementation
        System.out.println("Animal is sleeping...");
    }
}

class Dog implements Animal {
    public void eat() {
        System.out.println("Dog is eating...");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.eat();
        myDog.sleep();  // Calls default method from interface
    }
}
```

### *A class can implement multiple interfaces*

## Abstract classes

An abstract class in Java is a partially implemented class that cannot be instantiated - this is something commonly asked about in interviews.

It serves as a base class for other classes, allowing common behavior to be shared while enforcing method implementation in subclasses.

```java
abstract class Animal {
    abstract void makeSound();  // Abstract method (no body)

    void sleep() {  // Concrete method (has a body)
        System.out.println("Animal is sleeping...");
    }
}

// Concrete subclass
class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Dog barks.");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.makeSound();  // Calls overridden method
        myDog.sleep();      // Inherited method from Animal
    }
}
```
