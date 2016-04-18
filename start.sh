#!/bin/sh

if [ "$MY_COOKIE" != "" ] ; then
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/kazoo/config.ini;
fi

if [ ! -d "/root" ]; then
    mkdir /root;
fi

/opt/kazoo/scripts/start-ecallmgr.sh
/opt/kazoo/scripts/start-apps.sh
