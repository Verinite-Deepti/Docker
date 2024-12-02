# Docker Compose 

### 1. **React Frontend** (`react-app`)
The frontend is a React application that communicates with the backend service.

#### Configuration:
- **Build Context**: The frontend application is built from the `./frontend` directory.
- **Port Mapping**: Exposes the container's port `3000` to the host machine, allowing access to the React app at `http://localhost:3000`.
- **Dependencies**: The React frontend depends on the `backend` service. It ensures that the backend starts before the frontend service.
- **Network**: The frontend is connected to the `app-network` bridge network for inter-service communication.

### 2. **Spring Boot Backend** (`backend`)
The backend is a Spring Boot application that connects to a MySQL database to serve APIs to the frontend.

#### Configuration:
- **Build Context**: The backend is built from the `./backend` directory.
- **Port Mapping**: Exposes the container's port `8090` to the host machine, making the backend available at `http://localhost:8090`.
- **MySQL Dependency**: The backend waits for the `mysql` service to become healthy before starting. The `depends_on` condition ensures that the backend starts only after MySQL is ready.
- **Environment Variables**:
  - **SPRING_DATASOURCE_URL**: Database connection URL to MySQL.
  - **SPRING_DATASOURCE_USERNAME**: Database username (`root`).
  - **SPRING_DATASOURCE_PASSWORD**: Database password (`Verinite@123`).
- **Network**: The backend service is part of the `app-network` bridge network.

### 3. **MySQL Database** (`mysql`)
This service runs a MySQL database with persistent storage for the backend application.

#### Configuration:
- **Image**: Uses the `mysql:8.0` Docker image.
- **Environment Variables**:
  - **MYSQL_ROOT_PASSWORD**: The password for the MySQL root user (`Verinite@123`).
  - **MYSQL_DATABASE**: Creates a database named `cla_config` upon initialization.
- **Volume**: The `mysql-data` volume ensures that database data is persisted even when the container is stopped or restarted.
- **Port Mapping**: Exposes the container's MySQL port `3306` to the host's port `3307`.
- **Healthcheck**: Ensures that MySQL is healthy and ready to accept connections by using `mysqladmin ping`.
- **Network**: The MySQL service is also connected to the `app-network` bridge network.

### 4. **Flyway Database Migrations**
Flyway is a database migration tool that can be used to apply migrations automatically.

#### Configuration:
- **Image**: The `flyway/flyway:latest` image is used for migrations.
- **Command**: The migration command connects to the `mysql` service and applies migrations.
- **Dependencies**: The Flyway service depends on the `mysql` service to ensure MySQL is available before attempting migrations.
- **Network**: Flyway also connects to the `app-network`.

### 5. **Networks**

The services communicate with each other over the `app-network`, which is a custom bridge network. The bridge network allows containers to discover and communicate with each other by their service names (e.g., `backend`, `mysql`).

### 6. **Volumes**

#### `mysql-data` Volume:
This volume ensures that the MySQL database's data is persisted between container restarts. The volume stores the MySQL data in the `/var/lib/mysql` directory within the container.

- **Frontend (React app)**: `http://localhost:3000`
- **Backend (Spring Boot)**: `http://localhost:8090`

### Build and Start the Containers

```bash
docker-compose up --build
```
### Stopping the Containers

To stop the running containers,`Ctrl + C` or run 

```bash
docker-compose down
```

