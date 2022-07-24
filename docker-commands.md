# Docker

## Delete

### Delete all running containers at once
docker ps -aq | xargs docker stop | xargs docker rm

### Delete all images at once
docker images -q | xargs docker rmi -f




