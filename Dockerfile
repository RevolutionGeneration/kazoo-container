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
RUN apt-get update && apt-get install -y autoconf automake bison build-essential fail2ban gawk git-core wget zip unzip make libncurses5-dev libssl-dev gcc g++ openjdk-6-jdk unixodbc-dev xsltproc vim-nox libexpat1-dev libxml2-dev

# Install dependencies
ADD build/install-deps.sh /root/install-deps.sh
WORKDIR /root
RUN chmod +x install-deps.sh
RUN ./install-deps.sh
RUN rm install-deps.sh

# Download Kazoo
RUN git clone --depth=50 --branch=master https://github.com/2600hz/kazoo.git /opt/kazoo

WORKDIR /opt/kazoo/
RUN make

RUN mkdir /etc/kazoo
ADD conf/kazoo/app.config /etc/kazoo/app.config
ADD conf/kazoo/config.ini /etc/kazoo/config.ini
ADD conf/kazoo/vm.args /etc/kazoo/vm.args

RUN mkdir /var/log/kazoo
RUN ln -s /var/log/kazoo /opt/kazoo/scripts/log

# Startup Script and Ports
COPY scripts/start-apps.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start-apps.sh

COPY scripts/start-ecallmgr.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start-ecallmgr.sh

COPY start.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]