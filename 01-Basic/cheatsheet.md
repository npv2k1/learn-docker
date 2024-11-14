### Docker Markdown Cheat Sheet

#### 1. **Docker Basics**
```bash
# Show Docker version
docker --version

# Show system-wide Docker information
docker info

# List Docker CLI commands
docker --help
```

#### 2. **Images Management**
```bash
# Pull an image from Docker Hub
docker pull <image_name>

# List all images
docker images

# Remove an image
docker rmi <image_name_or_id>

# Build an image from a Dockerfile
docker build -t <image_name> .

# Tag an image for pushing to a registry
docker tag <image_name> <registry>/<username>/<image_name>:<tag>

# Push an image to a registry
docker push <registry>/<username>/<image_name>:<tag>
```

#### 3. **Containers Management**
```bash
# Run a container
docker run <image_name>

# Run a container in detached mode
docker run -d <image_name>

# Run a container with a specific name
docker run --name <container_name> <image_name>

# Start an existing container
docker start <container_name>

# Stop a running container
docker stop <container_name>

# Restart a stopped container
docker restart <container_name>

# Remove a container
docker rm <container_name_or_id>

# Remove all stopped containers
docker container prune
```

### Docker `run` Command Cheat Sheet

#### Basic Syntax
```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

#### Common Options

| Option                         | Description |
|--------------------------------|-------------|
| `-d`, `--detach`               | Run container in the background (detached mode). |
| `--name <container_name>`      | Assign a name to the container. |
| `-it`                          | Open an interactive terminal (useful for shells). |
| `--rm`                         | Automatically remove the container when it exits. |
| `-p <host_port>:<container_port>` | Publish container’s port(s) to the host. |
| `-e <key=value>`               | Set environment variables. |
| `--env-file <file>`            | Load environment variables from a file. |
| `-v <host_path>:<container_path>` | Mount a host volume to the container. |
| `--network <network_name>`     | Connect container to a specific network. |
| `--link <container_name>`      | Link to another container. |
| `--hostname <hostname>`        | Set the hostname of the container. |
| `--restart <policy>`           | Set restart policy (`no`, `always`, `on-failure`, `unless-stopped`). |
| `--cpus <num>`                 | Limit CPU usage (e.g., `--cpus="0.5"` for half a CPU). |
| `--memory <size>`              | Limit memory usage (e.g., `--memory="512m"`). |
| `--entrypoint <command>`       | Override the default entrypoint. |

#### Examples

```bash
# Run a container in detached mode with a specific name
docker run -d --name my_container nginx

# Run a container with an interactive terminal
docker run -it ubuntu /bin/bash

# Run a container and automatically remove it after it stops
docker run --rm alpine

# Run a container with environment variables
docker run -e VAR_NAME=value my_image

# Run a container with ports published to the host
docker run -p 8080:80 my_image

# Run a container with a volume mounted
docker run -v /host/data:/container/data my_image

# Run a container with limited CPU and memory
docker run --cpus="1.5" --memory="1g" my_image
```

#### Restart Policies

| Policy              | Description |
|---------------------|-------------|
| `no`                | Do not restart the container if it stops. |
| `always`            | Always restart the container regardless of exit status. |
| `on-failure`        | Restart only if the container exits with a non-zero status. |
| `unless-stopped`    | Restart always except if manually stopped. |

Example:
```bash
docker run --restart always my_image
```

#### 4. **Container Interaction**
```bash
# List all running containers
docker ps

# List all containers (including stopped)
docker ps -a

# Show container logs
docker logs <container_name_or_id>

# Attach to a running container
docker attach <container_name>

# Execute a command in a running container
docker exec -it <container_name> <command>

# Open a shell in a running container
docker exec -it <container_name> /bin/bash
```

#### 5. **Volumes Management**
```bash
# Create a volume
docker volume create <volume_name>

# List all volumes
docker volume ls

# Inspect a volume
docker volume inspect <volume_name>

# Remove a volume
docker volume rm <volume_name>

# Remove all unused volumes
docker volume prune
```

#### 6. **Network Management**
```bash
# List all networks
docker network ls

# Inspect a network
docker network inspect <network_name>

# Create a network
docker network create <network_name>

# Connect a container to a network
docker network connect <network_name> <container_name>

# Disconnect a container from a network
docker network disconnect <network_name> <container_name>

# Remove a network
docker network rm <network_name>

# Remove all unused networks
docker network prune
```

#### 7. **Docker Compose**
```yaml
# Run Docker Compose (create and start containers)
docker-compose up

# Run Docker Compose in detached mode
docker-compose up -d

# Stop services started by Docker Compose
docker-compose stop

# Stop and remove containers, networks, images, and volumes
docker-compose down

# Build images before starting containers
docker-compose up --build

# Display Compose logs
docker-compose logs
```

#### 8. **Docker System Cleanup**
```bash
# Remove all stopped containers
docker container prune

# Remove all unused images
docker image prune

# Remove all unused networks
docker network prune

# Remove all dangling volumes
docker volume prune

# Clean up everything at once
docker system prune
```