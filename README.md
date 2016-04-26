Kazoo Dockerfile
================

This project can be used to deploy a Kazoo server inside a Docker container.
The container currently uses master branch (kazoo v4).

## Start

```
 docker run \
    -tid \
    --net=host \ 
    --name=kazoo \
    -e MY_COOKIE=COOKIE \
    revgen/kazoo-container /bin/bash
``` 


