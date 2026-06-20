# Peringkat 1: Guna imej Maven dengan Eclipse Temurin 17
FROM maven:3.8.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Peringkat 2: Guna imej Eclipse Temurin 17 JRE (Lebih ringan)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Pastikan nama fail JAR ini sama dengan nama dalam folder target anda
COPY --from=build /app/target/schoollms-backend-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
