#!/bin/bash

before=`grep '^Port ' /etc/ssh/sshd_config  | cut -d ' ' -f2`
[[ $before -lt 10000 ]] && echo "wrong port number : '$before'" && exit 1
if [ -z $1 ];then
	after=`echo $before + 1 | bc`
else
	after=$1
fi

echo " port $before => $after "
echo 
sed -r -i "s/(^Port) $before$/\1 $after/" /etc/ssh/sshd_config && echo 'changed sshd port' || echo 'failed change sshd port'
service ssh restart || exit 1
service iptables stop || exit 1
echo 
sed -r -i "s/(--dport) $before (-j ACCEPT)/\1 $after \2/" /etc/sysconfig/iptables && echo 'changed sshd port' || echo 'failed change sshd port'
service iptables start || exit 1
