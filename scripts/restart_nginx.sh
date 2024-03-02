#!/bin/sh
mkdir -p /var/log/goon
touch /var/log/goon/log.txt
nginx -s reload >> /var/log/goon/log.txt 2>&1
