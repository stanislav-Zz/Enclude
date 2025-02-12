# Используем образ Maven для сборки проекта
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Копируем все файлы проекта в контейнер
COPY . .

# Выполняем сборку проекта
RUN mvn clean package -Dmaven.repo.local=/app/.m2/repository

# Используем минимальный образ JDK для запуска приложения
FROM openjdk:17-jdk-slim
WORKDIR /app

# Копируем собранный JAR файл из предыдущего этапа
COPY --from=build /app/target/EducationalProject-1.0-SNAPSHOT.jar /app/EducationalProject-1.0-SNAPSHOT.jar

# Устанавливаем переменную окружения PORT
ENV PORT 8080

# Устанавливаем точку входа для запуска приложения
ENTRYPOINT ["java", "-jar", "/app/EducationalProject-1.0-SNAPSHOT.jar"]

# Указываем порт, который будет прослушиваться приложением
EXPOSE 8080