# Jenkins.
FROM ubuntu:14.04
MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Enable the Ubuntu multiverse repository.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse">> /etc/apt/source.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list

# Update
RUN apt-get update && apt-get install -y software-properties-common

# Install Dependencies.
RUN apt-get update && apt-get install -y autoconf automake bison build-essential fail2ban gawk git-core wget zip unzip make libncurses5-dev libssl-dev gcc g++ openjdk-6-jdk unixodbc-dev xsltproc vim-nox

# Install source code dependencies.
ADD build/install-deps.sh /root/install-deps.sh
WORKDIR /root
RUN chmod +x install-deps.sh
RUN ./install-deps.sh
RUN rm install-deps.sh

# Download Kazoo
RUN git clone https://github.com/2600hz/kazoo.git -b 3.22 /opt/kazoo

# TODO add kazoo user
#RUN adduser --gecos "Kazoo Voice Platform" --no-create-home --disabled-login --disabled-password --system --ingroup kazoo --home /opt/kazoo kazoo
#RUN chown -R kazoo:kazoo /opt/kazoo

# useradd -m -d /opt/kazoo -s /bin/bash kazoo
# chown -R kazoo:kazoo /opt/kazoo
# su - kazoo
# alias sup="/opt/kazoo/utils/sup/sup" # I like to add this to the kazoo user's bash profile

WORKDIR /opt/kazoo
ENV ERL_LIBS=/opt/kazoo/lib
RUN make clean all

RUN mkdir /etc/kazoo
ADD conf/kazoo/app.config /etc/kazoo/app.config
ADD conf/kazoo/config.ini /etc/kazoo/config.ini
ADD conf/kazoo/vm.args /etc/kazoo/vm.args

# TODO configure fail2ban

# TODO start kazoo
