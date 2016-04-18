Kazoo Dockerfile
================

This project can be used to deploy a Kazoo server inside a Docker container.
The container currently uses the latest stable release version 3.22.

## Start
start revgen/couchdb-container with --name couchdb
start revgen/rabbitmq-container with --name rabbitmq

or alternatively update /etc/host file 

```
 docker run \
  -h node0.example.com \
  -tid \
  --dns=8.8.8.8 \
  -p 0.0.0.0:8000:8000 \
  --link rabbitmq:rabbitmq \
  --link couchdb:couchdb \
  --name kazoo \
  -e MY_COOKIE=jasdfiNJIAEJb23ja9vjNAK \
  revgen/kazoo-container \
  /bin/bash
``` 


## Node specific post install configuration
start with specified hostname (use -h flag when starting docker) `docker run -h test.example.com`

## App Stack post install configuration
change ip addresses at /etc/kazoo/config.ini
change cookie at /etc/kazoo/config.ini
