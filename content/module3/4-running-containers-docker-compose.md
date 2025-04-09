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

This configuration file has `yaml` format and by default, when running the tool, it will search for a file called `compose.yml`.

Let's look at how the compose file can look for our java reference application:

TODO - add here a working docker compose file for our reference application.

## How to run the java app container with docker compose