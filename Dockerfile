# Create a new image with a minimal runtime environment
FROM openjdk:17-jre-alpine AS runtime

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file from the build image
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./app.jar

# Expose the port on which your application runs
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
