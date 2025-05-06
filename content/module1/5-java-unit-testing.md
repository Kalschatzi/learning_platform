+++
title = "Unit Testing"
type = ""
weight = 5
+++

 **Testing** is an essential part of software development.

There are different kinds of tests, but for now we'll focus on **unit testing**.

Unit testing is a software testing method where individual components (units) of a program are tested in isolation to ensure they work as expected. It helps detect bugs early, improves code quality, and simplifies debugging.

In Java we mainly use [JUnit](https://junit.org/junit5/).

In this example, we take our `Animal` class and test its methods.

```java
public class Animal {
    private String name;
    private int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String speak() {
        return "Some sound";
    }
}
```

Now we can write a test:

```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class AnimalTest {
    
    @Test
    void testAnimalName() {
        Animal animal = new Animal("Kali", 5);
        assertEquals("Kali", animal.getName());
    }

    @Test
    void testAnimalAge() {
        Animal animal = new Animal("Schatzi", 10);
        assertEquals(10, animal.getAge());
    }

    @Test
    void testAnimalSpeak() {
        Animal animal = new Animal("Kali", 3);
        assertEquals("Some sound", animal.speak());
    }
}
```

Unit tests are defined in the `test` section of the code, and typically follow the same package structure as the class they are testing.

The basic testing keyword is `assert`. This expects just a boolean function like `assert animal.getName().equals("Schatzi")`.
However, it's easier and nicer to use these functions as they have much more descriptive errors. Typically you'll have helper functions like:

- `assertEquals(expectedResult, actualResult)` - asserts the values are equal
- `assertNotEquals(expectedResult, actualResult)` - asserts the values aren't equal
- `assertThrows(class, executable)` - asserts the received executable throws the expected exception
- `assertTrue(actualResult)` - asserts the value is true
- `assertFalse(actualResult)` - asserts the value is false

etc...
There's a variety of different assertions, feel free to browse and choose the one that fits best your use case. 

This means that if we have our `Dog.java` file in `src/main/java/com/kalschatzi/Dog.java`, you'll have a test in `src/test/java/com/kalschatzi/DogTest.java`

Note that you *cannot* test private method. By definition, those methods can only be called by the same class, and even in this test class you can't call them. So you need to understand the code and restructure it in a way that it's interface is properly testable and there is no unreachable code.


## Code Test Coverage

Code Test Coverage is a metric that measures how much of your code is executed during unit testing. It helps identify untested parts of a codebase and ensures better software quality.

### Key Coverage Metrics

* Statement Coverage – Measures the percentage of executed statements.
* Branch Coverage – Ensures each possible branch (e.g., if-else) is tested.
* Function/Method Coverage – Checks if all methods/functions were executed.
* Condition Coverage – Tests all boolean expressions within conditions.
* Loop Coverage – Ensures loops execute at least once and cover edge cases.

## Mocking

Mocking is a technique in unit testing where you replace real objects with fake (mock) objects to simulate behavior without executing real dependencies like databases, APIs, or file systems. This makes testing faster, more isolated, and more reliable.


### Why Use Mocking?

* Avoid real dependencies (e.g., databases, network calls).
* Test in isolation (only the unit under test).
* Simulate different scenarios (errors, exceptions, delays).
* Improve test performance (no actual data processing).

There are multiple frameworks that can be used to mock functions in Java, the most popular is `Mockito`.
### Mockito

Let's say you have the class 

```java
public class AnimalRepository {
    public String getAnimalSound(String animal) {
        // Pretend this calls a database
        return switch (animal) {
            case "Dog" -> "Woof";
            case "Cat" -> "Meow";
            default -> "Unknown";
        };
    }
}
```

and

```java
public class AnimalService {
    private final AnimalRepository animalRepository;

    public AnimalService(AnimalRepository animalRepository) {
        this.animalRepository = animalRepository;
    }

    public String getAnimalSound(String animal) {
        return animalRepository.getAnimalSound(animal);
    }
}
```

We can have a test with

```java
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

class AnimalServiceTest {

    @Test
    void testGetAnimalSound() {
        // Create a mock of AnimalRepository
        AnimalRepository mockRepo = mock(AnimalRepository.class);

        // Define behavior: When getAnimalSound("Dog") is called, return "Woof"
        when(mockRepo.getAnimalSound("Dog")).thenReturn("Woof");

        // Inject the mock into AnimalService
        AnimalService service = new AnimalService(mockRepo);

        // Verify the behavior
        assertEquals("Woof", service.getAnimalSound("Dog"));

        // Ensure that the method was called exactly once
        verify(mockRepo, times(1)).getAnimalSound("Dog");
    }
}
```

Key Mockito Features:

* mock(Class.class) → Creates a mock object.
* when(mock.method()).thenReturn(value) → Defines behavior.
* verify(mock, times(n)).method() → Checks method calls.
* doThrow(new Exception()).when(mock).method() → Simulates exceptions.
* spy(Object) → Partially mocks an object (calls real methods unless stubbed).

With these methods you can test your application in scenarios that are hard to replicate, like when a specific call throws an unexpected exception.

## Test Driven Development (TDD)

Test-Driven Development (TDD) is a software development approach where you write tests before writing the actual implementation. It follows a Red-Green-Refactor cycle to ensure better code quality, maintainability, and reliability.

TDD Process (Red-Green-Refactor)

* Red – Write a failing test (no implementation yet).
* Green – Write just enough code to pass the test.
* Refactor – Improve the code while keeping tests green.

This cycle ensures that every feature is tested before implementation, reducing bugs and improving design.

When you ask people what TDD is, most just say it's "writing the tests before the code" but that's not the main reason. The main reason is to let test define the interface of the class, to avoid poorly written functions just because they might be easy to implement.



