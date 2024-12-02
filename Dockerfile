FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/cardtest-ai-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
