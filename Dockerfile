# ---- Stage 1: Build ----
# Use a Maven + Java 21 image to compile the code and produce a WAR file.
# This stage runs entirely inside Docker — no Maven needed on your machine.
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy the Maven project files and source code into the build container
COPY pom.xml .
COPY src ./src

# Compile and package the app into a WAR file (skip tests for now)
RUN mvn clean package -DskipTests


# ---- Stage 2: Run ----
# Use the official Open Liberty image as the base for the final container.
# This is a lean image — it only contains Liberty and your app, not Maven.
FROM icr.io/appcafe/open-liberty:kernel-slim-java21-openj9-ubi

# Copy server configuration into Liberty's config directory
COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml

# Copy the WAR file built in Stage 1 into Liberty's apps directory
COPY --chown=1001:0 --from=build /app/target/liberty-hello.war /config/apps/liberty-hello.war

# This script installs only the Liberty features listed in server.xml (keeps the image small)
RUN features.sh
