# ====== BUILD STAGE ======
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copy everything and build the JAR using Maven wrapper
COPY . .
RUN ./mvnw -B clean package -DskipTests

# ====== RUN STAGE ======
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
