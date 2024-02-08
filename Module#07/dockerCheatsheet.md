# Docker Cheat Sheet

Docker is an open-source platform that automates the deployment, scaling, and management of applications inside lightweight, portable containers. Containers allow you to package your application, together with its environment and dependencies, into a single unit that can run anywhere Docker is installed.

## Getting Started with Docker

### Installation

Docker can be installed on various operating systems. Visit the official Docker website for installation instructions for your platform: [Get Docker](https://docs.docker.com/engine/install/)

### Basic Concepts

- **Image**: A Docker image is a lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, environment variables, and config files.
- **Container**: A runtime instance of an image—what the image becomes in memory when executed.

## Docker Commands

### Managing Images

- **Pull an image from Docker Hub**
    ```bash
    docker pull <image_name>
    ```
- **List images**
    ```bash
    docker images
    ```
- **Remove an image**
    ```bash
    docker rmi <image_name>
    ```

### Managing Containers

- **Run a container**
    ```bash
    docker run [options] <image_name>
    ```
    Common options:
    - `-d`: detached mode
    - `-p`: port mapping
    - `--name`: name of the container
- **List running containers**
    ```bash
    docker ps
    ```
- **List all containers**
    ```bash
    docker ps -a
    ```
- **Stop a container**
    ```bash
    docker stop <container_name_or_id>
    ```
- **Remove a container**
    ```bash
    docker rm <container_name_or_id>
    ```

### Dockerfile

A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Example Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

### Building and Running with Dockerfile

- **Build an image from a Dockerfile**
    ```bash
    docker build -t <image_name> .
    ```
- **Run a container using the image**
    ```bash
    docker run -p 4000:80 <image_name>
    ```

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services.

### docker-compose.yml Example

```yaml
version: '3'
services:
  web:
    build: .
    ports:
     - "5000:5000"
  redis:
    image: "redis:alpine"
```

### Basic Docker Compose Commands

- **Start services**
    ```bash
    docker-compose up
    ```
- **Stop services**
    ```bash
    docker-compose down
    ```

## Best Practices

- Keep your images lightweight by using smaller base images.
- Use multi-stage builds to minimize the size of production images.
- Leverage build cache to speed up image building.
- Use `.dockerignore` files to exclude unnecessary files from your build context.
- Always tag your images with specific versions besides `latest`.
