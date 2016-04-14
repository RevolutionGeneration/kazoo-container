Kazoo Dockerfile
================

This project can be used to deploy a Kazoo server inside a Docker container.
The container currently uses the latest stable release version 3.22.

## Node specific post install configuration
start with specified hostname (use -h flag when starting docker) `docker run -h test.example.com`

## App Stack post install configuration
change ip addresses at /etc/kazoo/config.ini
change cookie at /etc/kazoo/config.ini
