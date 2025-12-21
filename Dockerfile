# ------ Stage 1: build with Maven ------
FROM maven:3.9.11-eclipse-temurin-17 AS builder
WORKDIR /workspace

# 1) copy only pom first to leverage Docker layer cache for dependencies
COPY pom.xml ./
# if you use a settings.xml or wrapper, copy them too (uncomment if present)
# COPY .mvn .mvn
# COPY .mvn/wrapper .mvn/wrapper

# Pre-fetch dependencies (helps caching)
RUN mvn -B -e dependency:resolve dependency:go-offline

# 2) copy source and build the fat jar
COPY src ./src
RUN mvn -B -DskipTests package

# ------ Stage 2: runtime (slim) ------
# Use a small JRE/JDK image. Change to a non-root runtime if you prefer.
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy jar from builder stage. Use wildcard generally safe if only one jar.
ARG JAR_FILE=target/*.jar
COPY --from=builder /workspace/${JAR_FILE} app.jar

# Create non-root user (recommended)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]

