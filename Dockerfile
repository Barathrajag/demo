# Use the official Maven image as a base image
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Create a new image with a minimal runtime environment
FROM adoptopenjdk/openjdk17:alpine-jre AS runtime

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file from the build image
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port on which your application runs
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
