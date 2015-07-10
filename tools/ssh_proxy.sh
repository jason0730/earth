#!/bin/bash

pid_file=~/bin/.pid/ssh-proxy.pid
pid=''
case "$1" in 
'start')
    ip=$2
    port=$3
    [ -z $ip ] || [ -z $port ] && echo "ssh_proxy start ip port" && exit 1
    if [ -f $pid_file ];then
        echo "first stop ssh-proxy , file $pid_file already had " && exit 1
    fi
    ssh -C -D 127.0.0.1:61024 sshproxy@$ip -p $port -g -c aes256-cbc 'iostat -xk 5' >/dev/null &
    pid="$!"
    if [ -z $pid ];then
        echo "invalid pid" && exit 2
    fi
    echo $pid > $pid_file && echo 'Start ssh-proxy successful'
;;
'stop')
    if [ ! -f $pid_file ];then
        echo "no $pid_file file" && exit 1
    fi
    pid=`head $pid_file`
    if [  -z $pid ];then
        echo "invalid pid" && exit 2
    fi
    ps -p $pid > /dev/null && kill $pid 
    rm $pid_file
    echo 'Stop ssh-proxy successful'
;;
'status')
    if [[ -f $pid_file ]];then
        echo "ssh-proxy is running" && exit 1
    else
        echo "ssh-proxy stop" && exit 3
    fi
;;
*)
    echo "usage: ssh-proxy {start|stop|status}" && exit 0
;;
esac
