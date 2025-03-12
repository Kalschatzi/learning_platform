+++
title = "Java Introduction"
type = ""
weight = 1
+++

## How to write Java?

Let's look at a basic Java application:

```java
package com.kalschatzi;

public class Main {
    public static void main(String args[]) {
        System.out.println("Hello, world");
    }
}

```

This will be the simplest Java application you can write. Here's how your folder structure should look like:

{{< figure src="/images/module1/java-intro-file-structure.png" >}}

Let's now deconstruct it line by line.

```java
package com.kalschatzi;
```
This is where package is, which is what Java calls code folders. If you look at the file structure image, you'll see it matches what's there.

Why does it matter? More details will come on this later, but it's a way to organize the code and ensure only certain other files have access to the correct code. There are plenty of approaches, and different developers might have different preferences, but you can study [Domain Driven Development - DDD](https://www.geeksforgeeks.org/domain-driven-design-ddd/) in case you're curious.

Next we define our class

```java
public class Main {
```

Here we have the class definition. With the `public` we're starting to talk about [encapsulation](https://www.geeksforgeeks.org/encapsulation-in-java/). This defines from where this class is accessible. As a root class, you can only have `public` or `package-private` access. The key difference is that you will not be allowed to create a new instance of a package-private class outside of that package.

You can also have a `private` class, but only as an inner class. Don't worry about any of these concepts for now, it can be something you look back.

### What's a class?
A class is a blueprint for creating objects. It contains fields (variables) and methods that define the behavior of the objects.
By having it you can create a new instance of that class that will represent the object. For example:

```java
public class Animal {
    private final String name;
    ...

```

In here you define that you have an animal, and that animal has a name. Then you can create a new Animal object.

```java
Animal animalKali = new Animal("Kali");
```

Here I've created an animal named `Kali`. I can create as many as I want with as many names as I want.

*We'll deconstruct that class later.*


Moving on to the next line we have
```java
    public static void main(String args[]) {
        if (args.length > 0) {
            System.out.println("Hello " + args[0]);
        } else  {
            System.out.println("Hello world");
        }
    }
```

All Java applications require this method in their `Main` class. It's the entrypoint and needs to be there.

What do all these keywords mean?
This a `public` function that is `static` (that can be used without creating a new instance), has no return or `void` return, it's called `main` and receives a list of arguments. These arguments are parameters passed when executing the application, for example:

```bash
javac Main.java  # Compile
java Main Tiago
```

This will print `Hello Tiago` as that's what I passed on the args.

And with this we have a working java application 🎉