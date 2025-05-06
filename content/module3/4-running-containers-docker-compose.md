+++
title = "Running containers with docker compose"
type = ""
weight = 5
+++

## What is docker compose?

Docker compose is a tool that simplifies the way we define and run containers.
Especially when having multiple containers, this tool can streamline the process for us.

For detailed information about this tool, have a look at the [Docker Compose](https://docs.docker.com/compose/) official documentation.

## How to write a docker compose file

In order to instruct docker compose what containers we want to run and how to run it (e.g: what ports we want to expose),
we need to create a configuration file. 

This configuration file has `yaml` format and by default, when running the tool, it will search for a file called `docker-compose.yaml` or `compose.yaml`.

Let's look at a service configuration in the  [docker compose file](https://github.com/Kalschatzi/reference-java-spring/blob/main/docker-compose.yaml) for the reference application.
The file looks like this:

```yaml
services:
  app:
    build: .
    ports:
      - "8080:8080"
```

What does this mean? 

The example above means that we configured a service called "app" that can be built based on a `Dockerfile` in the current directory, 
and we mapped the container port `8080` to the host port `8080` so that we can access it on localhost.
The purpose of this is to then be able to run the container in a simple way.

## How to run the java app container with docker compose

- Now that we have configured the ports, we can simply run this: `docker compose up app`
- To verify that the app is running, check the status endpoint: http://localhost:8080/private/status.
- To check what containers are running with docker compose, run: `docker compose ps`.

Note: There are other settings we can configure here, a full list can be found in the [compose file reference](https://docs.docker.com/reference/compose-file/). 
