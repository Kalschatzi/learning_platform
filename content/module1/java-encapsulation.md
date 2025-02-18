+++
title = "Encapsulation"
type = ""
weight = 2
+++

## What is encapsulation

Encapsulation is a fundamental concept in Object-Oriented Programming (OOP) that refers to bundling data (variables) and methods (functions) that operate on the data into a single unit (class) while restricting direct access to some details.

Key Points:
* Hides Internal Implementation: Prevents direct modification of object data from outside the class.
* Provides Data Security: Only controlled access through methods (getters/setters).
* Enhances Maintainability: Changes in implementation don’t affect external code.

## What does it actually look like?

Mean you need to understand a few java keywords:
- `public` - the whole code can see it
- `private` - only the code in the same class can see it
- `package` - the default and least explicitly used - only classes in the same package can see it


```java
public class Animal {
    private String name;  // Private variable (not accessible directly)

    // Default constructor - exists by default
    public Animal(){} 

    // Constructor
    public Animal(String name) {
        this.name = name;
    }

    // Getter method to access private variable
    public String getName() {
        return name;
    }

    // Setter method to modify private variable
    public void setName(String name) {
        this.model = name;
    }
}
```

So then I can use it in my implementation

```java
Animal animalKali = new Animal("Kali");
System.out.println(animalKali.getName());
animalKali.setName("Schatzi");
```

## What's with this.model = name;

If we look at the constructor, we see that we actually have 2 variables called `name`. One we receive as arguement and is what it's called a `local` variable.

The other is defined in the class and is called a `global` variable. If you have 2 variables like this with the same name, just be referencing it, you'll be accessing the `local` variable, so if you do `System.out.println(name)`, that `name` is what's received as argument. 

### How do you use the global one?
This is where the `this` keyword comes into play. So by having 
```java
this.name = name
```

What you're doing is storing the value of the `local` variable in the `global` variable so you can reuse it.


## Constants

What if I don't want the name to ever change? We'll we can make that a constant value. Constant values can be defined like

```java
public final String ENVIRONMENT_NAME="production"
```

You can also initialize it through the constructor.

```java
public class Animal {
    private final String name;
    
    public Animal(String name) {
        this.name = name
    }
}
```

This means that I cannot use a `setter` function as after it's initialized, the value `name` can never be affected, only read.
