#!/bin/bash

http_status_code=`curl -I 'https://www.youtube.com' -m 5 --socks5-hostname 127.0.0.1:$SSH_PROXY_PORT 2>/dev/null | head -1 | cut -d ' ' -f2`

if [[ $http_status_code != '200' ]];then
    ssh_proxy stop 2>/dev/null
    ssh_proxy start $SSH_PROXY_HOSTNAME $SSH_SERVER_PORT 2>/dev/null
    ps aux | grep ssh
fi
