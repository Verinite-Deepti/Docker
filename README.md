# Docker


Let's break down the Dockerfile in detail, explaining each line and command.

### Part 1: Node.js Dockerfile (Node.js + npm for a JavaScript/React app or backend)

```Dockerfile
FROM node:14-alpine
```
- **FROM node:14-alpine**: This line specifies the **base image** that your container will be built from. `node:14-alpine` means you're using a version of **Node.js 14** that is based on **Alpine Linux**, which is a very lightweight distribution, optimized for smaller images.

```Dockerfile
WORKDIR /app
```
- **WORKDIR /app**: This command sets the working directory for any subsequent commands that will run in the Docker container. In this case, it creates and/or switches to a directory called `/app`. All commands that follow (like `COPY`, `RUN`, etc.) will execute in this directory.

```Dockerfile
COPY package.json package-lock.json ./
```
- **COPY package.json package-lock.json ./**: This copies the `package.json` and `package-lock.json` files from your local machine into the `/app` directory in the Docker container. These files contain the **metadata and dependencies** for your Node.js application.

```Dockerfile
RUN npm install
```
- **RUN npm install**: This installs the dependencies specified in `package.json` (and locked in `package-lock.json`) using **npm** (Node Package Manager). It sets up the environment by downloading and installing all necessary libraries and dependencies your app needs to run.

```Dockerfile
COPY . .
```
- **COPY . .**: This copies all the files from your local directory (the current directory where the Dockerfile is located) into the `/app` directory in the container. This is where your application’s source code (like JavaScript files) is copied into the container.

```Dockerfile
RUN npm run build
```
- **RUN npm run build**: This command runs the **build script** defined in the `package.json` file. Typically, this compiles or bundles your code into a production-ready version. For example, in a React app, it would generate optimized static files in a `build/` directory.

```Dockerfile
EXPOSE 3000
```
- **EXPOSE 3000**: This tells Docker that your application will listen on port 3000. It’s a way of documenting which ports the container will use to communicate with the outside world. It doesn't actually open the port but indicates that the application will use this port for network traffic.

```Dockerfile
CMD ["npm", "start"]
```
- **CMD ["npm", "start"]**: This sets the default command to run when the container starts. In this case, it tells Docker to run `npm start`, which typically launches a web server (like Express, or a React development server) to start serving your application.

---

### Part 2: Java (OpenJDK) Dockerfile (Java application)

```Dockerfile
FROM openjdk:17-jdk-slim
```
- **FROM openjdk:17-jdk-slim**: This specifies the **base image** for your Java application. `openjdk:17-jdk-slim` uses a slimmed-down version of **OpenJDK 17**, which is a Java development kit (JDK). This image contains everything needed to run Java, but it’s smaller in size due to being based on a minimal image (slim).

```Dockerfile
WORKDIR /app
```
- **WORKDIR /app**: Similar to the previous one, this sets the working directory to `/app`. Any subsequent commands will execute inside this directory.

```Dockerfile
COPY target/cardtest-ai-0.0.1-SNAPSHOT.jar app.jar
```
- **COPY target/cardtest-ai-0.0.1-SNAPSHOT.jar app.jar**: This copies the `.jar` file (Java archive) from your local `target/` folder into the `/app` directory in the container, and renames it as `app.jar` in the container. A `.jar` file is the packaged output of a Java application that can be run.

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

### Key Concepts to Remember:

1. **FROM**: Specifies the base image to use for the container.
2. **WORKDIR**: Sets the working directory inside the container, so subsequent commands will run relative to that directory.
3. **COPY**: Copies files from your local machine into the container.
4. **RUN**: Executes commands inside the container (e.g., install dependencies, build code).
5. **EXPOSE**: Indicates which port the container will use for communication.
6. **CMD / ENTRYPOINT**: Specifies the default command to run when the container starts. `CMD` is generally for setting default arguments, and `ENTRYPOINT` defines the executable itself.

In short, the first part of the Dockerfile sets up a Node.js environment, installs dependencies, builds the app, and starts the app, while the second part sets up a Java environment and runs a Java `.jar` file.
