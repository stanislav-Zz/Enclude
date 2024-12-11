FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/your-app.jar /app/your-app.jar
ENTRYPOINT ["java", "-jar", "/app/your-app.jar"]