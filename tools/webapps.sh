#!/bin/bash

signal=$1

if [[ $signal == 'stop' ]];then
(
        sudo  /usr/local/bin/nginx -s stop 2>/dev/null
        sudo  /usr/local/sbin/php55-fpm stop 2>/dev/null
) >/dev/null
elif [[ $signal == 'start' ]];then
(
        sudo  /usr/local/bin/nginx -s stop 2>/dev/null
        sudo  /usr/local/bin/nginx 2>/dev/null
        sudo  /usr/local/sbin/php55-fpm restart 2>/dev/null
) >/dev/null
else
        echo "ex: $0 [stop|start]" && exit 1
fi
