+++
title = "Containerization with Docker"
type = ""
weight = 4
+++

## What is docker?

Docker is a platform that allows you to package and run an in an isolated environment called container.
For detailed information about the structure and what the docker platform provides, have a look at the [Docker Overview](https://docs.docker.com/get-started/docker-overview/)
page on the official docker documentation.

## Why using docker?

Docker allows us to separate your application from the actual infrastructure. So you can run the same container anywhere: in the cloud, on a server somewhere or on your local machine.
There are at least two major advantages that docker gives you when it comes to software development:
- isolation -> the fact that you don't need to worry when you move your application on another machine about what you need to install on the other machine
- repeatability -> the fact that running a docker container with your application gives the same results on your machine as in any other environment

There are a lot more advantages that docker provides, like security testing and tooling to test and deploy, but we won't focus on those 
as part of this module, as they will come up in more advanced modules and when we will focus on Software Delivery Lifecycle(SDLC). 

## Docker versus Virtual Machines

Virtual Machines(VMs) is another way to achieve both isolation and repeatability. 
The main difference between Docker and VMs:

- Docker containers have both the application code and its environment, including libraries, system tools, and runtime. Docker containers use the underlying host operating system kernel resources directly.
- Virtual Machines have their own operating system, they are essentially copies of physical machines.

## Basic docker concepts

### Docker container

Let's assume that you have a java application that you packaged in a JAR file, and you want to run it on your machine. 
What will happen, is that a process is executed on your machine.
When you do that, this might break if for example you don't have the right JRE on your environment anymore. 
The same thing is when you try to run this JAR file anywhere else. You need to make sure the target environment for running the JAR supports that.

Another scenario would be that you have two java applications, each of them requiring two separate JRE versions. 
How do you run them in the same time on any machine that has only one JRE? 

Docker comes with the concept of containerization. 
A container allows you to run your application in an isolated process that doesn't interfere with anything else on the host machine,
and it already has all the infrastructure requirements.
This way you can run one or multiple containers without additional infrastructure installation requirements and without them interfering with each other.

Addition information about containers can be found on the [Containers](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/) doc in the official documentation.

### Docker image

So how can we create docker container? We need somewhere to specify what this container needs, what files, what configuration. 
We basically need a blueprint for creating a container.
This blueprint is the docker image.
A container image is a standardized package that includes all the files, binaries, libraries, and configurations to run a container.

## How to create a docker image

A docker image needs a file to hold the configuration. This file is called the `Dockerfile`.
Here is the [Dockerfile](https://github.com/Kalschatzi/reference-java-spring/blob/main/Dockerfile) for the reference application.

In order to build an image and see what we have built, we need to start getting familiar with the `docker CLI`:

- To see everything that you can do with `docker` from your bash terminal, just type `docker`. This will give you a list of available commands. 
- To build an image simply do (assuming you are in the same directory as the `Dockerfile`): `docker build .` Note: `.` means you are building in the local directory. 
- To see the image you have built: `docker images`

## How to run a container

- To run the image you created above, take the docker `IMAGE ID` displayed when you run `docker images` and do: `docker run <docker IMAGE ID>`. 
- Now try and access the reference app status endpoint: http://localhost:8080/private/status. You will notice that you cannot connect to the server. 
  That is because you haven't actually exposed a port on your localhost so that the docker container can be reached. 
- To expose a port run `docker run -p 8080:8080 <docker IMAGE ID>`.
- Now have a look at http://localhost:8080/private/status again. You should get an `OK` response.
- Done, you now have a container running on your local machine!
- To see what containers are running, run `docker ps`.

What happened in the steps above?

First you identified an image that was created locally, in the local docker [registry](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-registry/). 

Then you run it and noticed that you cannot yet access it. Why is that? 
The purpose of containers is to run in isolation, including isolation from your local machine. So by default, you won't be able to access
them directly on your localhost, without exposing the port. 

For further explanation on exposing ports for docker containers, have a look at the official documentation 
for [exposed ports](https://docs.docker.com/engine/containers/run/#exposed-ports) and [how to publish ports](https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/#explanation).

There is an easier way to run containers, by using `docker compose` which we will cover in the [Running Containers with Docker Compose](4-running-containers-docker-compose) section.
