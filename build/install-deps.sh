#/bin/bash

# Install erlang
wget http://erlang.org/download/otp_src_R15B03-1.tar.gz -P /usr/src/
tar -C /opt/ -zxf /usr/src/otp_src_R15B03-1.tar.gz
cd /opt/otp_src_R15B03/
./configure && make && make install

