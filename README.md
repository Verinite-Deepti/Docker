# Docker

### Key Concepts to Remember:

1. **FROM**: Specifies the base image to use for the container.
2. **WORKDIR**: Sets the working directory inside the container, so subsequent commands will run relative to that directory.
3. **COPY**: Copies files from your local machine into the container.
4. **RUN**: Executes commands inside the container (e.g., install dependencies, build code).
5. **EXPOSE**: Indicates which port the container will use for communication.
6. **CMD / ENTRYPOINT**: Specifies the default command to run when the container starts. `CMD` is generally for setting default arguments, and `ENTRYPOINT` defines the executable itself.

### 1: Node.js Dockerfile (Node.js + npm for a JavaScript/React app)

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
- **RUN npm install**: This installs the dependencies specified in `package.json` and locked in `package-lock.json` using **npm** Node Package Manager. It sets up the environment by downloading and installing all necessary libraries and dependencies your app needs to run.

```Dockerfile
COPY . .
```
- **COPY . .**: This copies all the files from your current directory where the Dockerfile is located into the `/app` directory in the container. This is where your application’s source code is copied into the container.

```Dockerfile
RUN npm run build
```
- **RUN npm run build**: This command runs the **build script** defined in the `package.json` file. Typically, this compiles or bundles your code into a production-ready version.
  
```Dockerfile
EXPOSE 3000
```
- **EXPOSE 3000**: This tells Docker that your application will listen on port 3000. It’s a way of documenting which ports the container will use to communicate with the outside world. It doesn't actually open the port but indicates that the application will use this port for network traffic.

```Dockerfile
CMD ["npm", "start"]
```
- **CMD ["npm", "start"]**: This sets the default command to run when the container starts. In this case, it tells Docker to run `npm start`, which typically launches a web server to start serving your application.

---



