# some docker commands

## run file
```sh
$ docker run \
--rm \  # as soon as docker shutdown, remove that container
-v $(pwd):/src \  # giving docker access to current directory, mounting on docker's /src folder
python:3 \  # image name and tag
python /src/hello.py  # command to run in container
```

## run interpretor
```sh
$ docker run \
--rm \
-it \  # run interactive
-v $(pwd):/src \
python:3 \
python  # open python interpretor
```

## open a shell in container
```sh
$ docker run \
--rm \
-it \
-v $(pwd):/src \
python:3 \
/bin/bash  # opens a shell
```

## build custom image

### create a Dockerfile
```
From python:3
Run pip3 install numpy
```

```sh
$ docker build \
-t python_numpy \  # repo name
.  # look for Dockerfile in current dir
```

## start container in foreground
```sh
$ docker run \
--rm \
-v $(pwd):/usr/share/nginx/html \  # nginx html dir
-p 8080:80 \  # port 8080 of host mounted to 80 of docker container
nginx:latest
```

## start container in background
```sh
$ docker run \
--rm \
-d \  # run as daemon in background
-v $(pwd):/usr/share/nginx/html \
-p 8080:80 \
nginx:latest
```

## log into a runnning container

start a container in background, just like above example, then
```sh
$ docker exec -it <running_container_name> /bin/bash
```

## create a network to allow shareing between containers
```sh
$ docker network create multiple  # multiple is name
# check by
$ docker network ls
# create mysql container
$ docker run \
--rm \
-d \
--net multiple \  # make this container use the network multiple
--name mul_mysql \
-e MYSQL_ROOT_PASSWORD='root' \  # env variable with particular variable
mysql:5.6
# create (and open a terminal in) node.js container
docker run \
--rm \
-d \
-it \
--net multiple \
--name mul_node \
node:8 \
/bin/bash
```
