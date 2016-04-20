Kazoo Dockerfile
================

This project can be used to deploy a Kazoo server inside a Docker container.
The container currently uses the latest stable release version 3.22.

## Start
start revgen/couchdb-container with --name couchdb
start revgen/rabbitmq-container with --name rabbitmq
start revgen/freeswitch-container with --name freeswitch

```
 docker run \
  -h node0.example.com \
  -tid \
  --dns=8.8.8.8 \
  -p 0.0.0.0:8000:8000 \
  --link rabbitmq:rabbitmq \
  --link couchdb:couchdb \
  --link freeswitch:freeswitch \
  --name kazoo \
  -e MY_COOKIE=CHANGE_ME \
  revgen/kazoo-container \
  /bin/bash
``` 


