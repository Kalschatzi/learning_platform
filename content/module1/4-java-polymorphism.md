+++
title = "Polymorphism"
type = ""
weight = 4
+++

Polymorphism means "many forms" and allows a single interface (method, class, or function) to behave differently based on the context.

## Method overriding

This happens when a subclass provides a different implementation of a method defined in its parent class.

```java
class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Dog barks");
    }
}
```

This way we can define a `Dog` class that `extends` `Animal` and can `Override` the base method.

## Method overloading

This happens when multiple methods in the same class have the same name but different parameters.

```java
class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }

     void makeSound(int volume) {
        if (volume > 3) {
            System.out.println("Animal makes a LOUD sound");

        } else {
            System.out.println("Animal makes a sound");
        }
    }
}
´
```

## Polymorphism with interfaces

```java
interface Vehicle {
    void start();
}

class Car implements Vehicle {
    public void start() {
        System.out.println("Car starts");
    }
}

class Bike implements Vehicle {
    public void start() {
        System.out.println("Bike starts");
    }
}
public class Main {
    public static void main(String[] args) {
        Vehicle myVehicle = new Car();
        myVehicle.start();  // Output: Car starts

        myVehicle = new Bike();
        myVehicle.start();  // Output: Bike starts
    }
}
```

Pay attention to:
```java
Vehicle myVehicle = new Car();
```
In this example `myVehicle` is defined as the interface, being agnostic of the implementation. This is a good practice to keep in mind for the future. You can look into the [SOLID principle](https://www.geeksforgeeks.org/solid-principle-in-programming-understand-with-real-life-examples/)
