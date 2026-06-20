# Guna imej base Java
FROM openjdk:17-jdk-slim
# Salin fail JAR yang dibina ke dalam container
COPY target/schoollms-backend-1.0.0.jar app.jar
# Jalankan aplikasi
ENTRYPOINT ["java", "-jar", "/app.jar"]
