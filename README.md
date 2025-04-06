# System Administration Project: Docker Virtualization

## 📌 Project Overview
This project focuses on **using Docker to virtualize multiple services within a personal virtual machine**. The goal is to enhance system administration skills by setting up an infrastructure using **Docker Compose**.

### 🏗️ Infrastructure Setup
The following services must be containerized:
- **NGINX**: Acts as the only entry point to the infrastructure, running on **port 443** with **TLSv1.2 or TLSv1.3**.
- **WordPress**: Runs with **PHP-FPM**, but **without NGINX**.
- **MariaDB**: Database service for WordPress (**without NGINX**).

### 📂 Volumes & Networking
- **Persistent Volumes:**
  - One for the **WordPress database**.
  - Another for the **WordPress website files**.
- **Docker Network:** A custom network must be created to connect the containers.
- **Containers Configuration:**
  - Restart on failure.
  - Must follow best practices for **PID 1** process management.
  - No unnecessary loops (e.g., `sleep infinity`).

### 🔑 Security & Environment Variables
- **No `latest` tag** is allowed for Docker images.
- **Passwords must not be hardcoded** in Dockerfiles.
- **Environment variables (.env file) and Docker secrets** must be used for credentials.
- **Admin username restrictions:** Cannot include `admin`, `Admin`, `administrator`, or `Administrator`.

## 📁 Project Structure
```
.
├── Makefile
└── srcs/
    ├── docker-compose.yml
    ├── .env
    └── requirements/
        ├── mariadb/
        │   ├── conf/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── tools/
        ├── nginx/
        │   ├── conf/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── tools/
        └── wordpress/
        │   ├── conf/
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── tools/
```

## 🚀 Getting Started
### 1️⃣ Prerequisites
- Install **Docker** & **Docker Compose**.
- Ensure you have a **virtual machine** to run the project.
- Create the `.env` file with the required environment variables.
  ```sh
  DB_NAME=
  MARIA_DB_USER=
  MARIA_DB_USER_PASSWORD=
  MARIA_DB_ROOT_PASSWORD=
  
  DATA_PATH_WP=
  DATA_PATH_DB=
  
  DOMAIN_NAME=localhost
  WP_ADMIN_PASSWORD=
  WP_ADMIN_USER=
  WP_USER=
  WP_ADMIN_EMAIL=
  WP_USER_EMAIL=
  WP_USER_PASSWORD=
  ```

### 2️⃣ Build & Run the Containers
```sh
make
```
This will use the `Makefile` to build and run the Docker containers.

### 3️⃣ Access the Services
- Open a browser and visit `https://localhost`
- Confirm by clicking on `Advance` then `Proceed to localhost (unsafe)` because our certificate is self-signed.
- WordPress should be accessible via NGINX.

## 🛠️ Troubleshooting & Debugging
- Check logs:
```sh
docker logs <container_name>
```
- Restart a service:
```sh
make restart 
```
- Stop all containers:
```sh
make stop
```

## 📜 License
This project is for educational purposes as part of **42 School**.
