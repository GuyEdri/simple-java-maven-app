# Stage 1: Build the Maven project
FROM maven:3.8.4-openjdk-17 AS build

WORKDIR /app
COPY . /app

# Stage 2: Create lightweight Java image
FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY --from=build /app/target/my-app*.jar /app/my-app.jar

CMD ["java", "-jar", "my-app.jar"]
