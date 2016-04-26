#!/bin/sh

if [ "$MY_COOKIE" != "" ] ; then
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/kazoo/config.ini;
fi


alias sup="/opt/kazoo/utils/sup/sup"

echo "local0.* -/var/log/kazoo/kazoo.log" >> /etc/rsyslog.d/50-default.conf;
touch /var/log/kazoo/kazoo.log;
chown syslog /var/log/kazoo/kazoo.log;
chgrp adm /var/log/kazoo/kazoo.log;
service rsyslog restart;

/bin/bash