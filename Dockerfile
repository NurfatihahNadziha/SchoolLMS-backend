# Stage 1: Bina aplikasi
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Salin SEMUA fail dari repositori ke dalam folder /app
COPY . .

# Bina projek
RUN mvn clean package -DskipTests

# Stage 2: Jalankan aplikasi
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Salin fail .jar dari stage build
COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
