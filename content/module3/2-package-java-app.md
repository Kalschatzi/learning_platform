+++
title = "Package Java applications"
type = ""
weight = 3
+++

## What does packaging means?

Packaging of an application, or a library, means that we are creating a compressed and executable file from our code.

## What is the purpose of packaging?

A packaged file is easy to distribute and run on different environments. It contains all the code you created, plus 
all the resources and dependencies needed to run your code.

## How to package Java code

The standard file format used to package java code is [JAR](https://en.wikipedia.org/wiki/JAR_(file_format)) which stands for Java ARchive.
In this module, we are going to use the [gradle](https://docs.gradle.org/current/userguide/userguide.html) tool to create a java executable jar that contains all the dependencies.

In practice, whenever you write code, your build tool will use a tool like `gradle` to package a jar for you. 
You will not use gradle in a production environment because by the time we get there, you will already have a `JAR` file
that you can run. 

To see how to run a `JAR` file have a look at the next section. 

But for now, let's build a `JAR` using `gradle`, for our [reference app](https://github.com/Kalschatzi/reference-java-spring):

- first inspect what `gradle` tasks you have available by running `./gradlew tasks`.
- in the tasks list, have a look at the tasks available in the "Build tasks" section. You should have tasks like: `clean` and `build`.
- run  `./gradlew :service:build` -> this should produce a directory called `build`
- inspect the `build/lib` directory and you should find a jar file
- in order to clean up the `build` directory, run `./gradlew :service:clean`

### How to run the JAR file

When we deploy our application somewhere, in a testing or production environment, we will need to run our jar file.

The pre-requisite for running a jar file is to have already a `JRE` (Java Runtime Environment) installed on the machine.

What is the difference between `JDK` and `JRE`?
The `JDK` includes a `JRE` and additional tools that allow you to develop and debug java applications.

This means that when you develop on your machine you need the whole kit, you need the `JDK`, but in production or in any environment
where you just need to run your software, is sufficient to have only the `JRE` available. 

To run the reference application: 
- run the jar directly: `java -jar service/build/libs/service-0.0.1-SNAPSHOT.jar`
- or use gradle: `./gradlew :service:bootRun`

To check that the application is running, visit http://localhost:8080/private/status in your browser, and you should get a response with the content `OK`.


