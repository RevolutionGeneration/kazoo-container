Kazoo Dockerfile
================

This project can be used to deploy a Kazoo server inside a Docker container.
The container currently uses the latest stable release version 3.22.

## Start

```
 docker run \
    -tid \
    --net=host \
    -h n1.wdcloud.eu \ 
    --name=kazoo \
    -e MY_COOKIE=COOKIE \
    revgen/kazoo-container /bin/bash
``` 


