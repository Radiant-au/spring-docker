# Use Eclipse Temurin OpenJDK 21 base image
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy JAR from target folder
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose port (Render sets this dynamically)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
