# Используем образ Maven для сборки проекта
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Копируем все файлы проекта в контейнер
COPY . .

# Устанавливаем права на выполнение для mvnw
RUN chmod +x mvnw

# Выполняем сборку проекта
RUN ./mvnw clean package

# Используем минимальный образ JDK для запуска приложения
FROM openjdk:17-jdk-slim
WORKDIR /app

# Копируем собранный JAR файл из предыдущего этапа
COPY --from=build /app/target/your-app.jar /app/your-app.jar

# Устанавливаем переменную окружения PORT
ENV PORT 8080

# Устанавливаем точку входа для запуска приложения
ENTRYPOINT ["java", "-jar", "/app/your-app.jar"]

# Указываем порт, который будет прослушиваться приложением
EXPOSE 8080