FROM maven:3.8.5-eclipse-temurin-17 AS build
WORKDIR /app
# Tukar kepada folder sebenar
COPY schoollms-backend/pom.xml .
COPY schoollms-backend/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Tukar laluan untuk mencari fail .jar yang dibina
COPY --from=build /app/target/schoollms-backend-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
