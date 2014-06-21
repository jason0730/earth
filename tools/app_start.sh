#!/bin/bash


(
sudo  /usr/local/bin/nginx -s stop 2>/dev/null
sudo  /usr/local/bin/nginx 2>/dev/null
sudo  /usr/local/sbin/php55-fpm restart 2>/dev/null
) > /dev/null
