# Create development container with volume access to host development directory

## Useful Links

[https://devopscube.com/run-docker-in-docker/]
[https://dzone.com/articles/how-to-develop-your-nodejs-docker-applications-fas]

## First Option - IGNORE! (isolated localhost won't work) [docker run --privileged -d docker:dind]

docker run --it --privileged -d -v C:\Development\leadbox\docker-in-docker-poc:/nodejsdata --name dind-test docker:dind

### Log to Container

docker exec -it dind-test /bin/sh

### Build image from development container

docker build -t nodejs-docker-in-docker-poc .

### Run nodejs-poc app inside development container

docker run -d -p 8080:8080 nodejs-docker-in-docker-poc:latest

----

## Second Option

docker run -v /var/run/docker.sock:/var/run/docker.sock -v C:\Development\leadbox\docker-in-docker-poc:/usr/src/app/poc-node-app -ti docker

cd /usr/src/app/poc-node-app

docker pull ubuntu

docker build -t nodejs-docker-in-docker-poc .

docker run -d -p 8080:8080 nodejs-docker-in-docker-poc:latest
