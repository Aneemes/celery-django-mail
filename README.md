# Using Celery and Redis with Django to perform background task

## Overview

This project is a basic implementation of celery on django to handle background tasks, in this case, we are sending emails in the background. The project features a simple form that prompts user to input email and an email will be sent to that email address using celery. I've used redis as a broker here, alternatively we could use RabbitMQ. I've used docker for contanerization.

## Project Setup and Running Guide

This guide will walk you through the setup and running process for a project that uses Celery and Redis to send emails in the background. Please note that this guide is focused on setting up the project on a Windows machine. Also, its just a demo with a basic implementation. 
If you wish to set this up on your local machine, there is a separate branch [`no-docker`](https://github.com/Aneemes/celery-redis-django/tree/no-docker) with its own [README.md](https://github.com/Aneemes/celery-redis-django/tree/no-docker). 
Follow the instructions provided there.

## Prerequisites

Before starting, make sure you have the following prerequisites installed:

- Python 3.11.x
- Docker Desktop 

## Project Setup

1. Clone the project repository to your local machine and switch to main branch
2. Open a terminal or command prompt and navigate to the project directory.

2. Build the containers
```
docker compose build
```

3. Start the containers
```
docker compose up
```
or you could also run it in detached mode
```
docker compose up -d
```
or skip the seprate build command and run
```
docker compose up --build
```
4. Accessing the container logs
```
docker compose logs -f <container_name>
```
check the containers with:
```
docker ps
```
5. Stopping containers
```
docker compose down
```

6. Access the application by visiting `http://127.0.0.1:8000` in your browser.

## Container Descriptions

1. nginx
- Purpose: Nginx web server for handling HTTP requests.
- Description: Nginx acts as a reverse proxy, forwarding client requests to the appropriate backend server (in this case, 'server' container). It is commonly used for load balancing, caching, and serving static content.

2. server
- Purpose: Backend server for running application code.
- Description: This container hosts the primary application code. It handles business logic, API endpoints, and other server-side functionalities. The 'nginx' container forwards HTTP requests to this server for processing.

3. worker
- Purpose: Celery worker for handling asynchronous tasks.
- Description: Celery is a distributed task queue system, and the 'worker' container runs Celery workers. It executes background tasks asynchronously, providing scalability and efficiency for tasks that can run independently of the main application flow.

4. redis
- Purpose: Redis database server.
- Description: Redis is an in-memory data structure store used as a database, cache, and message broker. The 'redis' container provides a scalable and high-performance solution for storing key-value pairs, often used by Celery for task queue management.

5. db
- Purpose: PostgreSQL database server.
- Description: PostgreSQL is a powerful open-source relational database management system. The 'db' container hosts the PostgreSQL server, managing the application's data storage and retrieval. It provides a robust and scalable solution for relational database needs.
Certainly! Here's a brief explanation of where users can make changes to ports and other configurations in your Docker Compose file:

### Nginx Service (`nginx`):
- **Ports:** The Nginx service is exposed on port 8080. Users can change the external port (left side of the colon) if needed. For example, to expose it on port 9090 externally, change `- 8080:8080` to `- 9090:8080`. Also should change the listening port on default.conf

### Server Service (`server`):
- **Ports:** The Django server is set to run on port 8000 within the container and is exposed externally on the same port. Users can modify the external port if required. For example, to use port 9000 externally, change `- "8000:8000"` to `- "9000:8000"`.

### Worker Service (`worker`):
- No specific port is exposed for the Celery worker, as it communicates internally.

### Redis Service (`redis`):
- **Ports:** The Redis service exposes port 6379. Users can change the external port if necessary.

### Database Service (`db`):
- **Ports:** The PostgreSQL service exposes port 5432. Users can change the external port if required.
- **Environment Variables:** Users can modify the environment variables under the `environment` section for PostgreSQL, such as database name, user, password, etc., according to their project requirements.

### Volumes:
- **Static Volume (`static_volume`):** This volume is mounted to store Django static files. Users can leave it as is or customize the path if needed.
- **Postgres Data Volume (`postgres_data`):** This volume stores PostgreSQL data. Users can leave it as is or customize the path if needed.

Additionally, users should be cautious when making changes to volumes or paths to ensure data persistence and proper functionality.

Feel free to adjust these configurations based on your project's requirements.

## Conclusion

You have successfully set up the project and started the Django server with docker. The application is now ready to send emails in the background using Celery and Redis.

