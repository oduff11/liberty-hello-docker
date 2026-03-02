# Project: Java Web App on Open Liberty (Docker / Containerized)

## Overview
A Java web application running on WebSphere Open Liberty (the free, open-source version of WebSphere Liberty) deployed in Docker containers. This is the containerized version of the project — the local on-prem version lives in `../liberty_local`.

## Tech Stack
- **Language:** Java
- **Runtime:** WebSphere Open Liberty (Open Liberty)
- **Containerization:** Docker (using the official `icr.io/appcafe/open-liberty` or `open-liberty` Docker image)
- **Testing:** Leverage Open Liberty's built-in testing capabilities inside containers

## Agent Roles
This project uses three specialized agents:
- **Planner agent** — designs features, architecture decisions, and breaks work into tasks
- **Coder agent** — implements features based on the planner's output
- **Tester agent** — writes and runs tests, validates behavior using Open Liberty's testing tools

## Goals
- Mirror the functionality of the local version (`../liberty_local`) but running in Docker
- Learn how to containerize a Java/Open Liberty application
- Understand Docker concepts: images, containers, volumes, port mapping
- Use Open Liberty's official Docker image as the base
- Build toward a portable, reproducible deployment

## Notes
- Prefer simple, clear code with explanations — this is a learning project
- The Open Liberty Docker image handles server configuration — focus on the app layer
- `server.xml` is the main Open Liberty config file — it lives inside the container
- docker-compose may be useful for managing the container alongside other services later
