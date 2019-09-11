#!/bin/bash

[ ! -d /app/log ] && mkdir -p /app/log &&
[ ! -d /app/git ] && mkdir -p /app/git &&
mv /app/startup.sh /usr/sbin/startup.sh &&
chmod +x /usr/sbin/startup.sh
