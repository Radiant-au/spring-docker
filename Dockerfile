# Stage 1: Build the JAR
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

# Copy Maven wrapper and project files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Stage 2: Run the JAR
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy the JAR from the builder image
COPY --from=builder /app/target/*.jar app.jar

# Expose dynamic port for Render
EXPOSE 8080

# Use PORT env var if provided
ENV PORT 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
