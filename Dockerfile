# Peringkat 1: Bina aplikasi
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Peringkat 2: Jalankan aplikasi
FROM openjdk:17-jdk-slim
WORKDIR /app
# Pastikan nama fail JAR ini sama dengan nama dalam folder target anda
COPY --from=build /app/target/schoollms-backend-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
