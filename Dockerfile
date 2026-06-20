# Peringkat 1: Bina aplikasi
FROM maven:3.8.5-eclipse-temurin-17 AS build
WORKDIR /app
# Salin terus dari root
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Peringkat 2: Jalankan aplikasi
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Salin daripada hasil binaan tadi
COPY --from=build /app/target/schoollms-backend-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
