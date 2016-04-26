#/bin/bash

# Install erlang
wget wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb /tmp
dpkg -i /tmp/erlang-solutions_1.0_all.deb
apt-get update
apt-get install esl-erlang

