# SWE-645-Docker
Docker container for SWE Assignment 2

To build docker image: `docker build -t [image name] .`

(In order to get the docker image created for our project, please run the following command: `docker pull prafulladevi/swe645-project2:latest`)

To run the docker image as a container: `docker run -it --rm -p 8888:8080 [container name]`

To check if docker image is running: `docker ps -a`

To stop the image: `docker stop [container name]`

To delete the image: `docker rm [container name]`

Notes:
----------
- Docker images cannot have the same name
- Docker containers cannot have the same name
- It is best not to give containers and images the same name
- The exposed port of the container (most likely 8080) should not be the same redirect port of the local machine (recommend using 8888 or 8081 instead)
