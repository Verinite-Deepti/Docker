# SpringBoot 


1. **FROM**: Specifies the base image to use for the container.
2. **WORKDIR**: Sets the working directory inside the container, so subsequent commands will run relative to that directory.
3. **COPY**: Copies files from your local machine into the container.
4. **RUN**: Executes commands inside the container (e.g., install dependencies, build code).
5. **EXPOSE**: Indicates which port the container will use for communication.
6. **CMD / ENTRYPOINT**: Specifies the default command to run when the container starts. `CMD` is generally for setting default arguments, and `ENTRYPOINT` defines the executable itself.


```Dockerfile
FROM openjdk:17-jdk-slim
```
- **FROM openjdk:17-jdk-slim**: This specifies the **base image** for your Java application. `openjdk:17-jdk-slim` uses a slimmed-down version of **OpenJDK 17**, which is a JDK. This image contains everything needed to run Java, but it’s smaller in size due to being based on a minimal image (slim).

```Dockerfile
WORKDIR /app
```
- **WORKDIR /app**: Similar to the previous one, this sets the working directory to `/app`. Any subsequent commands will execute inside this directory.

```Dockerfile
COPY target/cardtest-ai-0.0.1-SNAPSHOT.jar app.jar
```
- **COPY target/cardtest-ai-0.0.1-SNAPSHOT.jar app.jar**: This copies the `.jar` file from your local `target/` folder into the `/app` directory in the container, and renames it as `app.jar` in the container. A `.jar` file is the packaged output of a Java application that can be run.

```Dockerfile
EXPOSE 8090
```
- **EXPOSE 8090**: This tells Docker that the Java application will be running on port 8090 inside the container. Again, this is for documentation purposes and doesn't actually open the port.

```Dockerfile
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
- **ENTRYPOINT ["java", "-jar", "/app/app.jar"]**: This specifies the **command to run when the container starts**. It runs `java -jar /app/app.jar`, which starts your Java application packaged as a `.jar` file. 
    - `java`: The command to run the Java application.
    - `-jar`: This flag tells Java to execute a `.jar` file.
    - `/app/app.jar`: This is the path to the `.jar` file inside the container.

---
